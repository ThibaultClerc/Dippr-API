class Api::TrocsController < ApplicationController
  before_action :authenticate_user!

  # def index
  #   if user_params.include?(:user_id)
  #     @marketdishes = User.find(user_params[:user_id]).market_dishes
  #   else
  #     @marketdishes = MarketDish.all
  #   end
  #   render jsonapi: @marketdishes
  # end

  # def show
  #   @marketdish = MarketDish.find(marketdishes_params[:id])
  #   render jsonapi: @marketdish
  # end

  def create
    @troc = Troc.new(troc_params)
    @troc.caller_dish_id = current_user.id
    if @troc.save
      render jsonapi: @troc, status: :created
    else
      render jsonapi: @troc.errors, status: :unprocessable_entity
    end
  end


  private

  def troc_params
    params.permit(:id, :answer_dish_id, :status)
  end

  def user_params
    params.permit(:user_id)
  end

end
