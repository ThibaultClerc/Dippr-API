class Api::TrocsController < ApplicationController
  before_action :authenticate_user!

  def index
    if user_params.include?(:user_id)
      @trocs = User.find(user_params[:user_id]).market_dishes.where(market_dish_type: 0)
      if Troc.all.any? {|troc| @trocs.include?(troc) }
        Troc.where()
    else
      @trocs = Troc.all
    end
    render jsonapi: @trocs
  end

  # def show
  #   @marketdish = MarketDish.find(marketdishes_params[:id])
  #   render jsonapi: @marketdish
  # end

  def create
    @user_trocs = User.find(current_user.id).trocs
    if !@user_trocs.include?(Troc.find(troc_params[:answer_dish_id])) 
      @troc = Troc.new(troc_params)
      if @troc.save
        render jsonapi: @troc, status: :created
      else
        render jsonapi: @troc.errors, status: :unprocessable_entity
      end
    else
      render jsonapi: { message: 'Troc for this dish has already been asked' }, status: :internal_server_error
    end
  end

  def destroy
    @troc = Troc.find(troc_params[:id])
    if current_user.id === @troc.caller_dish.user_dish.user.id
      @troc.destroy
    end
  end


  private

  def troc_params
    params.permit(:id, :answer_dish_id, :status, :caller_dish_id)
  end

  def user_params
    params.permit(:user_id)
  end

end
