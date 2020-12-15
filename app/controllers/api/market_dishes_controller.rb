class Api::MarketDishesController < ApplicationController
  def index
    if marketdishes_params.include?(:user_id)
      @marketdishes = User.find(marketdishes_params[:user_id]).market_dishes
    else
      @marketdishes = MarketDish.all
    end
    render jsonapi: @marketdishes
  end

  def show
    @marketdish = MarketDish.find(marketdishes_params[:id])
    render jsonapi: @marketdish
  end

  def search
    @marketdishes = MarketDish.search_by_term(marketdishes_params[:query])
    render jsonapi: @marketdishes
  end

  private

  def marketdishes_params
    params.permit(:id, :user_id, :user_dish_id, :market_dish_type, :query)
  end
end
