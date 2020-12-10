class Api::DishIngredientsController < ApplicationController
  before_action :set_dish_ingredient, only: [:show, :update, :destroy]

  # GET /dish_ingredients
  def index
    @dish_ingredients = DishIngredient.all

    render json: @dish_ingredients
  end

  # GET /dish_ingredients/1
  def show
    render json: @dish_ingredient
  end

  # POST /dish_ingredients
  def create
    @dish_ingredient = DishIngredient.new(dish_ingredient_params)

    if @dish_ingredient.save
      render json: @dish_ingredient, status: :created
    else
      render json: @dish_ingredient.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /dish_ingredients/1
  def update
    if @dish_ingredient.update(dish_ingredient_params)
      render json: @dish_ingredient
    else
      render json: @dish_ingredient.errors, status: :unprocessable_entity
    end
  end

  # DELETE /dish_ingredients/1
  def destroy
    @dish_ingredient.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_dish_ingredient
      @dish_ingredient = DishIngredient.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def dish_ingredient_params
      params.require(:dish_ingredient).permit(:dish_id, :ingredient_id)
    end
end
