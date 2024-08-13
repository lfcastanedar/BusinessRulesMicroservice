class DocumentsController < ApplicationController
  before_action :authenticate_user!, except: [:search_in_web, :search_in_web_by_person, :details_by_smart_contract]
  before_action :set_document, only: [:update, :destroy]
  before_action :set_user, only: [:create, :index, :update]

  # GET /documents
  def index
    @documents = Document.joins(:step, :model_page).where(user_id: @user.id, family_commissary_id: @user.family_commissary_id)
    @documents = @documents.where.not(step_id: Step.find_by(code: 'finished').id)
    @documents = @documents.select(
      :id,
      :title,
      :address,
      :document_number,
      'steps.title AS steps_title',
      'model_pages.name AS model_pages_name',
      :created_at
    )

    render json: @documents
  end

  def search

    family_commissary_id = current_user.family_commissary_id

    @documents = Document.joins(:step, :model_page, :user)

    unless params[:title].blank?
      @documents = @documents.where('documents.title LIKE ?', "%#{ params[:title].upcase }%")
    end

    unless params[:address].blank?
      @documents = @documents.where('documents.address LIKE ?', "%#{ params[:address].downcase }%")
    end

    unless params[:document_number].blank?
      @documents = @documents.where('documents.document_number LIKE ?', "%#{ params[:document_number].upcase }%")
    end

    unless params[:model_page_id].blank?
      @documents = @documents.where(model_page_id: params[:model_page_id])
    end

    unless params[:step_id].blank?
      @documents = @documents.where(step_id: params[:step_id])
    end

    @documents = @documents.where(family_commissary_id: family_commissary_id)

    @documents = @documents.select(
      :id,
      :title,
      :address,
      :document_number,
      'steps.title AS steps_title',
      'model_pages.name AS model_pages_name',
      :created_at,
      "concat(users.first_name, ' ', users.last_name) as user_family_comisssary"
    )

    render json: @documents
  end

  def search_in_web
    @person_type = PersonType.find_by(code: 'applicant')
    
    @documents = []
    if params[:type] == 'process' && params[:type].blank? == false
      @documents = Document.joins(:step, :model_page, :user)
      .where('documents.document_number LIKE ? ', "%#{ params[:number].upcase }%")
    end

    if params[:type] == 'address' && params[:type].blank? == false
      @documents = Document.joins(:step, :model_page, :user).where('documents.address LIKE ?', "%#{ params[:number].downcase }%")
    end

    @documents = @documents.select(
      :id,
      :title,
      :address,
      :document_number,
      'steps.title AS steps_title',
      'model_pages.name AS model_pages_name',
      :created_at
    )

    @documents = @documents.map do |item|
      persons = item.complaint_participants.where(person_type_id: @person_type.id).map do |person| person.get_fullname() end
      item = item.attributes
      item.merge!(applicant: persons.join(", "))
    end

    

    render json: @documents
  end

  def search_in_web_by_person
    @person_type = PersonType.find_by(code: 'applicant')
    
    @documents = []

    unless params[:fullname].blank?
      @documents = Document.joins(:step, :model_page, :user, :complaint_participants)
      .where('(complaint_participants.first_name LIKE ? OR complaint_participants.last_name LIKE ?)
      AND complaint_participants.person_type_id = ?', "%#{ params[:fullname] }%", "%#{ params[:fullname] }%", @person_type.id)


      @documents = @documents.select(
      :id,
      :title,
      :address,
      :document_number,
      'steps.title AS steps_title',
      'model_pages.name AS model_pages_name',
      :created_at
    )

    @documents = @documents.map do |item|
      persons = item.complaint_participants.where(person_type_id: @person_type.id).map do |person| person.get_fullname() end
      item = item.attributes
      item.merge!(applicant: persons.join(", "))
    end
    end

    render json: @documents
  end

  # GET /documents/1
  def show
    @document = Document.joins(:step, :model_page, :user).select(
      :id,
      :title,
      :address,
      :document_number,
      'steps.title AS steps_title',
      'steps.code AS steps_code',
      'model_pages.name AS model_pages_name',
      "concat(users.first_name, ' ', users.last_name) as user_family_comisssary"
    ).find_by(address: params[:id])

    render json: @document
  end

  def details_by_smart_contract
    @http_response = {}
    response = Faraday.get(ENV['URL_DAPP'] + "Document/get_detail/" + params[:address]) do |req|
      req.headers['Content-Type'] = 'application/json'
    end

    if(response.status == 200)
      @http_response = JSON.load(response.body)      
    end

    render json: @http_response
  end

  # POST /documents
  def create
    @document = Document.new(document_params)
    @document.user_id = @user.id
    @document.family_commissary_id = @user.family_commissary.id
    @document.step = Step.find_by(code: 'created')

    status = :created
    response_data = nil
  
    Document.transaction do
      if @document.save
        #host_address = ENV['HOST_ADDRESS']       

        begin
          puts ENV['URL_DAPP'] + "Document/create"

          response = Faraday.post(ENV['URL_DAPP'] + "Document/create") do |req|
            req.headers['Content-Type'] = 'application/json'
            req.body = set_request_params_for_smart_contract_creation
          end        
          
          if(response.status == 200)
            @http_response = JSON.load(response.body)
            
                      
            @document.address = @http_response['address']
            @document.save!
            set_workflow_history

            response_data = @document

          else
            puts response.body
            status = :internal_server_error
            response_data = { error: "Error en la creación del contrato" }
            raise ActiveRecord::Rollback
          end
        rescue => e
          status = :internal_server_error
          response_data = { error: e }
          raise ActiveRecord::Rollback
        end
      else
        status = :unprocessable_entity
        response_data = @document.errors
      end
    end
  
    render json: response_data, status: status, location: @document
  end

  # PATCH/PUT /documents/1
  def update
    status = :created
    response_data = nil

    if @document.step.code == 'finished'
      render json: { error: 'El proceso está cerrado'}, status: bad_request 
      return
    end

    Document.transaction do
      previos_step = @document.step_id
      if @document.update(update_document_params)
        set_workflow_history(previos_step)
        response_data = @document
      else
        response_data = @document.errors
        status = :unprocessable_entity

      end

      if @document.step.code == 'finished'
        puts "ENTRA A ACTUALIZAR"
        response = Faraday.get(ENV['URL_DAPP'] + "document/GetCloseFolder/" + @document.address) do |req|
          req.headers['Content-Type'] = 'application/json'
        end  


      end
    rescue => e
      status = :internal_server_error
      response_data = { error: e }
      raise ActiveRecord::Rollback
    end

    render json: response_data, status: status
  end

  # DELETE /documents/1
  def destroy
    @document.destroy
  end

  private
    def set_user
      @user = current_user
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_document
      @document = Document.find_by(address: params[:id])
    end

    # Only allow a list of trusted parameters through.
    def document_params
      params.require(:document).permit(:title, :model_page_id)
    end

    def update_document_params
      params.require(:document).permit(:step_id, :user_id)
    end

    def set_request_params_for_smart_contract_creation
      {
        title: @document.title,
        module: ModelPage.find(@document.model_page_id).name,
        document_number: @document.document_number,
        office: @user.family_commissary.id
        }.to_json
    end

    def set_workflow_history(previos_step = nil)
      @workflowhistory = WorkFlowHistory.new
      @workflowhistory.address = @document.address
      @workflowhistory.previos_step = previos_step
      @workflowhistory.next_step = @document.step_id
      @workflowhistory.created_by = @user.get_fullname
      @workflowhistory.user_id = @user.id
      @workflowhistory.comment = params[:comment]
      @workflowhistory.save
    end
end
