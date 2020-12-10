class Api::UserDishTagsController < ApplicationController
  before_action :set_user_dish_tag, only: [:show, :update, :destroy]

  # GET /user_dish_tags
  def index
    @user_dish_tags = UserDishTag.all

    render json: @user_dish_tags
  end

  # GET /user_dish_tags/1
  def show
    render json: @user_dish_tag
  end

  # POST /user_dish_tags
  def create
    @user_dish_tag = UserDishTag.new(user_dish_tag_params)

    if @user_dish_tag.save
      render json: @user_dish_tag, status: :created
    else
      render json: @user_dish_tag.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /user_dish_tags/1
  def update
    if @user_dish_tag.update(user_dish_tag_params)
      render json: @user_dish_tag
    else
      render json: @user_dish_tag.errors, status: :unprocessable_entity
    end
  end

  # DELETE /user_dish_tags/1
  def destroy
    @user_dish_tag.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user_dish_tag
      @user_dish_tag = UserDishTag.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def user_dish_tag_params
      params.require(:user_dish_tag).permit(:user_dish_id, :tag_id)
    end
end
