class Api::DishTagsController < ApplicationController
  before_action :set_dish_tag, only: [:show, :update, :destroy]

  # GET /dish_tags
  def index
    @dish_tags = DishTag.all

    render json: @dish_tags
  end

  # GET /dish_tags/1
  def show
    render json: @dish_tag
  end

  # POST /dish_tags
  def create
    @dish_tag = DishTag.new(dish_tag_params)

    if @dish_tag.save
      render json: @dish_tag, status: :created
    else
      render json: @dish_tag.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /dish_tags/1
  def update
    if @dish_tag.update(dish_tag_params)
      render json: @dish_tag
    else
      render json: @dish_tag.errors, status: :unprocessable_entity
    end
  end

  # DELETE /dish_tags/1
  def destroy
    @dish_tag.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_dish_tag
      @dish_tag = DishTag.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def dish_tag_params
      params.require(:dish_tag).permit(:dish_id, :tag_id)
    end
end
