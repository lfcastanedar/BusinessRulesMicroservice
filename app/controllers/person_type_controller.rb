class PersonTypeController < ApplicationController
    def index
        @personTypes = PersonType.select(:id, :name).order(:name)
        render json: @personTypes
    end


    
end
