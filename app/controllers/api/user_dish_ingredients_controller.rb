class Api::UserDishIngredientsController < ApplicationController
  before_action :set_user_dish_ingredient, only: [:show, :update, :destroy]

  # GET /user_dish_ingredients
  def index
    @user_dish_ingredients = UserDishIngredient.all

    render json: @user_dish_ingredients
  end

  # GET /user_dish_ingredients/1
  def show
    render json: @user_dish_ingredient
  end

  # POST /user_dish_ingredients
  def create
    @user_dish_ingredient = UserDishIngredient.new(user_dish_ingredient_params)

    if @user_dish_ingredient.save
      render json: @user_dish_ingredient, status: :created
    else
      render json: @user_dish_ingredient.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /user_dish_ingredients/1
  def update
    if @user_dish_ingredient.update(user_dish_ingredient_params)
      render json: @user_dish_ingredient
    else
      render json: @user_dish_ingredient.errors, status: :unprocessable_entity
    end
  end

  # DELETE /user_dish_ingredients/1
  def destroy
    @user_dish_ingredient.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user_dish_ingredient
      @user_dish_ingredient = UserDishIngredient.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def user_dish_ingredient_params
      params.require(:user_dish_ingredient).permit(:user_dish_id, :ingredient_id)
    end
end
