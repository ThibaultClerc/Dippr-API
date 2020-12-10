class Api::UserDishesController < ApplicationController
  before_action :set_user_dish, only: [:show, :update, :destroy]

  # GET /user_dishes
  def index
    @user_dishes = UserDish.all

    render jsonapi: @user_dishes
  end

  # GET /user_dishes/1
  def show
    render json: @user_dish
  end

  # POST /user_dishes
  def create
    @user_dish = UserDish.new(user_dish_params)

    if @user_dish.save
      render json: @user_dish, status: :created
    else
      render json: @user_dish.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /user_dishes/1
  def update
    if @user_dish.update(user_dish_params)
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
      params.require(:user_dish).permit(:name, :description).merge({user_id: current_user.id})
    end

end
