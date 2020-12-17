class Api::MarketDishesController < ApplicationController
  before_action :authenticate_user!, only: [:create, :destroy]

  def index
    if user_params.include?(:user_id)
      @marketdishes = User.find(user_params[:user_id]).market_dishes
    else
      @marketdishes = MarketDish.all
    end
    render jsonapi: @marketdishes
  end

  def show
    @marketdish = MarketDish.find(marketdishes_params[:id])
    render jsonapi: @marketdish
  end

  def create
    @market_dish = MarketDish.new(marketdishes_params)
    if @market_dish.save
      render jsonapi: @market_dish, status: :created
    else
      render jsonapi: @market_dish.errors, status: :unprocessable_entity
    end
  end

  def search
    @marketdishes = MarketDish.search_by_term(query_params[:query])
    render jsonapi: @marketdishes
  end

  private

  def marketdishes_params
    params.permit(:id, :user_dish_id, :market_dish_type, :end_date)
  end

  def user_params
    params.permit(:user_id)
  end

  def query_params
    params.permit(:query)
  end
end
