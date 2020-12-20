class Api::DonationsController < ApplicationController
  before_action :authenticate_user!

  def index
    if user_params.include?(:user_id)
      @donations1 = Donation.where(answerer_id: user_params[:user_id])
      @donations2 = Donation.where(caller_id: user_params[:user_id])
      @donations = @donations1 + @donations2
    else
      @donations = Donation.all
    end
    render jsonapi: @donations
  end

  def show
    @donation = Donation.find(donation_params[:id])
    render jsonapi: @donation
  end

  def create
    @user_donations = User.find(current_user.id).donations
    if !Donation.exists?(caller_id: current_user.id, answerer_id: donation_params[:answerer_id], status: 0) || !Donation.exists?(caller_id: current_user.id, answerer_id: donation_params[:answerer_id], status: 1)
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

  def update
    @donation = Donation.find(donation_params[:id])
    if @donation.pending? || @donation.confirmed?
      if @donation.update(status: donation_params[:status])
        render json: @donation
      else
        render json: @donation.errors, status: :unprocessable_entity
      end
    end
  end

  private

  def donation_params
    params.permit(:id, :answer_dish_id, :status, :answerer_id)
  end

  def user_params
    params.permit(:user_id)
  end

end
