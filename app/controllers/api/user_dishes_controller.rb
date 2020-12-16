class Api::UserDishesController < ApplicationController
  before_action :set_user_dish, only: [:show, :update, :destroy]
  before_action :authenticate_user!, only: [:create, :destroy]

  # GET /user_dishes
  def index
    if user_dish_params.include?(:user_id)
      @user_dishes = User.find(user_dish_params[:user_id]).user_dishes
    else
      @user_dishes = UserDish.all
    end
    render jsonapi: @user_dishes
  end

  # GET /user_dishes/1
  def show
    render jsonapi: @user_dish
  end

  # POST /user_dishes
  def create
    @user_dish = UserDish.new(user_dish_params)
    @user_dish.user_id = current_user.id
    if file_params[:file]
      @user_dish.photo.attach(file_params[:file])
      @user_dish.photo_url = url_for(@user_dish.photo)
    end
    if @user_dish.save
      render jsonapi: @user_dish, status: :created
    else
      render jsonapi: @user_dish.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /user_dishes/1
  def update
    if file_params[:file]
      @user_dish.photo.attach(file_params[:file])
      photo_url = url_for(@user_dish.photo)
    end
    if @user_dish.update(photo_url: photo_url)
      render json: @user_dish
    else
      render json: @user_dish.errors, status: :unprocessable_entity
    end
  end

  # DELETE /user_dishes/1
  def destroy
    @user_dish.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user_dish
      @user_dish = UserDish.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def user_dish_params
      params.permit(:id, :name, :description, :user_id, :dish_rating, :photo_url)
    end

    def file_params
      params.permit(:file)
    end
end