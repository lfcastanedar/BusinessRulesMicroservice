class ControlPagesController < ApplicationController
  before_action :authenticate_user!, except: [:get_page_controls]
  before_action :set_control_page, only: [:show, :update, :destroy]

  # GET /control_pages
  def index
    @control_pages = ControlPage.all

    render json: @control_pages
  end

  # GET /control_pages/1
  def show
    render json: @control_page
  end

  def get_page_controls
    response = Faraday.get(ENV['URL_DAPP'] + "document/get_page_controls/" + params[:address]) do |req|
      req.headers['Content-Type'] = 'application/json'
    end

    if(response.status == 200)
      body = JSON.load(response.body)
      render json: body
    else
      render json: 'error', status: :bad_request
    end
    
  end

  # POST /control_pages
  def create

    @document = Document.find(params[:document_id])
    @step = @document.step



    @control_page = ControlPage.new(control_page_params.except(:base64))
    @control_page.created_by = current_user.get_fullname
  
    status = :created
    response_data = nil
  
    ControlPage.transaction do
      if @control_page.save
        #@document = @control_page.document
        @page_control_type = @control_page.page_control_type
  
        response = Faraday.post( ENV['URL_DAPP'] + "Document/add_document") do |req|
          req.headers['Content-Type'] = 'application/json'
          req.body = {  
            Id: @control_page.id,
            Name: @control_page.name,
            Origen: @page_control_type.name,
            CreatedBy: @control_page.created_by,
            DocumentNumber: @document.document_number,
            CreateOn: @control_page.created_at.strftime('%d/%m/%Y'),
            ContractAddress: @document.address,
            Base64: params[:base64]
          }.to_json
        end
        begin
          if(response.status == 200)
            body = JSON.load(response.body)
            @control_page.hash_code = body['hashCode']
            @control_page.hash_algorithm = body['hashAlgorithm']

            if @step.code == 'created'
              @step = Step.find_by(code: 'in_process')

              @workflowhistory = WorkFlowHistory.new
              @workflowhistory.address = @document.address
              @workflowhistory.previos_step = @document.step_id
              @workflowhistory.next_step = @step.id
              @workflowhistory.created_by = current_user.get_fullname              
              @workflowhistory.user_id = current_user.id
              @workflowhistory.save

              @document.step = @step
              @document.save
            end

            response_data = @control_page
          else
            puts 'Respuesta'
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
        response_data = @control_page.errors
      end
    end
    
    render json: response_data, status: status, location: @control_page
  
  end

  
  # PATCH/PUT /control_pages/1
  def update
    if @control_page.update(control_page_params)
      render json: @control_page
    else
      render json: @control_page.errors, status: :unprocessable_entity
    end
  end

  # DELETE /control_pages/1
  def destroy
    @control_page.destroy
  end

  def get_document
    response = Faraday.post( ENV['URL_DAPP'] + "document/GetDocument") do |req|
      req.headers['Content-Type'] = 'application/json'
      req.body = params.to_json
    end

    if(response.status == 200)
      body = JSON.load(response.body)
      render json: body
    else
      render json: { error: 'No se ha encontrado el archivo'}, status: :bad_request
    end
  end

  def get_document_folder
    puts ENV['URL_DAPP'] + "document/GetDocumentFolder"
    response = Faraday.post( ENV['URL_DAPP'] + "document/GetDocumentFolder") do |req|
      req.headers['Content-Type'] = 'application/json'
      req.body = params.to_json
    end

    if(response.status == 200)
      body = JSON.load(response.body)
      render json: body
    else
      render json: { error: 'No se ha encontrado el archivo'}, status: :bad_request
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_control_page
      @control_page = ControlPage.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def control_page_params
      params.require(:control_page).permit(:name, :document_id, :page_control_type_id, :base64)
    end
end
