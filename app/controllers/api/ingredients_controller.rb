class Api::IngredientsController < ApplicationController
  before_action :set_ingredient, only: [:show, :update, :destroy]

  # GET /ingredients
  def index
    @ingredients = Ingredient.all

    render jsonapi: @ingredients
  end

end
