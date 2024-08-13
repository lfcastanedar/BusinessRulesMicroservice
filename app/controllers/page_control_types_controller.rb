class PageControlTypesController < ApplicationController
  before_action :set_page_control_type, only: [:show, :update, :destroy]

  # GET /page_control_types
  def index
    @page_control_types = PageControlType.all.order(:name)

    render json: @page_control_types
  end
end
