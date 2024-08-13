class ModelPagesController < ApplicationController
  before_action :set_model_page, only: [:show, :update, :destroy]

  # GET /model_pages
  def index
    @model_pages = ModelPage.where(active: true).order(:name).select(:id, :name)

    render json: @model_pages
  end
end
