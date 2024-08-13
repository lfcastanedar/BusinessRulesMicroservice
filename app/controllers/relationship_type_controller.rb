class RelationshipTypeController < ApplicationController
    def index
        @relationshipTypes = RelationshipType.select(:id, :name).order(:name)
        render json: @relationshipTypes
    end
end
