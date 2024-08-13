class WorkFlowController < ApplicationController
    #before_action :set_workflow_history, only: [:get_workflow_histories]

    def get_workflow_histories
        @worlflow_histories = WorkFlowHistory.joins("LEFT JOIN steps a ON work_flow_histories.previos_step = a.id")
        @worlflow_histories = @worlflow_histories.joins("INNER JOIN steps b ON work_flow_histories.next_step = b.id")
        @worlflow_histories = @worlflow_histories.where(address: params[:address])
        @worlflow_histories = @worlflow_histories.select(
            "a.title AS previos_step_title",
            "b.title AS next_step_title",
            "work_flow_histories.created_at AS created_at",
            "work_flow_histories.created_by AS created_by",
            "work_flow_histories.comment AS comment"
            ).order("work_flow_histories.created_at")

        render json: @worlflow_histories
    end

    def get_steps
        @document = Document.find_by(address: params[:address])    
    
        @steps = Step.joins("INNER JOIN work_flow_steps ON work_flow_steps.next_step = steps.id ")
        @steps = @steps.where("work_flow_steps.model_page_id = '#{@document.model_page_id}' AND work_flow_steps.previos_step = '#{@document.step_id}'")
        #@steps = @steps.where(model_page_id: @document.model_page_id, previos_step: @document.step_id)
        render json:  @steps.select(:id, :code, :title).order(:title)
      end

    private
        def set_workflow_history
            @worlflow_histories = WorkFlowHistory
        end
end