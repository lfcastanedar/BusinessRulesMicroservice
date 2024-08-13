class FamilyCommissariesController < ApplicationController
  before_action :set_family_commissary, only: [:show, :update, :destroy]

  # GET /family_commissaries
  def index
    @family_commissaries = FamilyCommissary.all.order(:name)

    render json: @family_commissaries
  end

  # GET /family_commissaries/1
  def show
    render json: @family_commissary
  end

  # POST /family_commissaries
  def create
    @family_commissary = FamilyCommissary.new(family_commissary_params)

    if @family_commissary.save
      render json: @family_commissary, status: :created, location: @family_commissary
    else
      render json: @family_commissary.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /family_commissaries/1
  def update
    if @family_commissary.update(family_commissary_params)
      render json: @family_commissary
    else
      render json: @family_commissary.errors, status: :unprocessable_entity
    end
  end

  # DELETE /family_commissaries/1
  def destroy
    @family_commissary.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_family_commissary
      @family_commissary = FamilyCommissary.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def family_commissary_params
      params.require(:family_commissary).permit(:name)
    end
end
