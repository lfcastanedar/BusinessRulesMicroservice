class ComplaintParticipantsController < ApplicationController
  before_action :set_complaint_participant, only: [:show, :update, :destroy]

  # GET /complaint_participants
  def index
    #@document = Document.find_by(address: params[:address])

    #render json: @document.complaint_participants
    @complaint_participants = ComplaintParticipant.joins(
      :document
      ).left_joins(
      :document_type,
      :health_promoting_entity,
      :person_type,
      :relationship_type
      ).select(
        'complaint_participants.*',
        'document_types.name AS document_type_name',
        'health_promoting_entities.name AS health_promoting_entity_name',
        'person_types.name AS person_type_name',
        'relationship_types.name AS relationship_type_name'
        ).where(document: { address: params[:address] })
    render json: @complaint_participants

  end

  # GET /complaint_participants/1
  def show
    @document = Document.find_by(address: params[:address])

    render json: @document.complaint_participants
  end

  # POST /complaint_participants
  def create
    @document = Document.find_by(address: params[:address_smart_contract])
   
    
    @complaint_participant = ComplaintParticipant.new(complaint_participant_params)
    @complaint_participant.document_id = @document.id

    if @complaint_participant.save
      self.set_updated_document()
      render json: @complaint_participant, status: :created
    else
      render json: @complaint_participant.errors
    end
  end

  # PATCH/PUT /complaint_participants/1
  def update
    if @complaint_participant.update(complaint_participant_params)
      @document = @complaint_participant.document
      self.set_updated_document()
      render json: @complaint_participant
    else
      render json: @complaint_participant.errors, status: :unprocessable_entity
    end
  end

  # DELETE /complaint_participants/1
  def destroy
    @document = @complaint_participant.document
    self.set_updated_document()
    @complaint_participant.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_complaint_participant
      @complaint_participant = ComplaintParticipant.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def complaint_participant_params
      params.require(:complaint_participant).permit(
        :id,
        :first_name, 
        :last_name, 
        :document_type_id, 
        :dni, 
        :age, 
        :displaced, 
        :occupation, 
        :health_promoting_entity_id,
        :person_type_id,
        :relationship_type_id,
        :telephone, 
        :mobile,
        :email,
        :address,
        :neighborhood,
        :address_smart_contract
        )
    end

    def set_updated_document
      previos_step = @document.step_id
      if @document.does_it_have_person_types
        @document.step_id = Step.registered_persons.id
      else
        @document.step_id = Step.created.id
      end
      @document.save
      if previos_step != @document.step_id
        self.set_workflow_history(previos_step)
      end
    end

    def set_workflow_history(previos_step)
      @user = current_user
      @workflowhistory = WorkFlowHistory.new
      @workflowhistory.address = @document.address
      @workflowhistory.previos_step = previos_step
      @workflowhistory.next_step = @document.step_id
      @workflowhistory.created_by = @user.get_fullname
      @workflowhistory.user_id = @user.id
      @workflowhistory.save
    end
end
