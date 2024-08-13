class HealthPromotingEntityController < ApplicationController
    def index
        @healthPromotingEntities = HealthPromotingEntity.select(:id, :name).order(:name)
        render json: @healthPromotingEntities
    end
end
