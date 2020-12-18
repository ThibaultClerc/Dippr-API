class Api::DonationsController < ApplicationController
  before_action :authenticate_user!

  def index
    if user_params.include?(:user_id)
      @donations = User.find(user_params[:user_id]).donations
    else
      @donations = Donation.all
    end
    render jsonapi: @donations
  end

  # def show
  #   @marketdish = MarketDish.find(marketdishes_params[:id])
  #   render jsonapi: @marketdish
  # end

  def create
    @user_donations = User.find(user_params[:user_id]).donations
    if !@user_donations.include?(Donation.find(donation_params[:answer_dish_id])) 
      @donation = Donation.new(donation_params)
      @donation.caller_id = current_user.id
      if @donation.save
        render jsonapi: @donation, status: :created
      else
        render jsonapi: @donation.errors, status: :unprocessable_entity
      end
    else
      render jsonapi: { message: 'Donation for this dish has already been asked' }, status: :internal_server_error
    end
  end

  def destroy
    @donation = Donation.find(donation_params[:id])
    if current_user.id === @donation.caller.id
      @donation.destroy
    end
  end


  private

  def donation_params
    params.permit(:id, :answer_dish_id, :status)
  end

  def user_params
    params.permit(:user_id)
  end

end
