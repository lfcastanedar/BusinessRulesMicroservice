class DocumentTypeController < ApplicationController
    def index
        @documentTypes = DocumentType.select(:id, :name).order(:name)
        render json: @documentTypes
    end

    def list_for_search
        @documentTypes = DocumentType.where.not(code: ['tarjeta', 'registro']).select(:id, :name).order(:name)
        render json: @documentTypes, status: :ok
    end
end
