class StepsController < ApplicationController
  
    def index
        @steps = Step.all.select(:id, :title).order(:title)
        render json: @steps
    end

  
end
