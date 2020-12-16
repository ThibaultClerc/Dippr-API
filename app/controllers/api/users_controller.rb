class Api::UsersController < ApplicationController
  before_action :find_user, only: [:show, :update]
  before_action :authenticate_user!, only: [:show, :update, :index]

  def index
    puts "dans index"
    @users = User.all
    render jsonapi: @users
  end

  def show
    render_jsonapi_response(@user)
  end

  def update
    if @user.update(user_params)
      render json: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  private

  def find_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:id, :email, :first_name, :last_name, :password, :country, :city, :street, :zip_code, :description, :phone_number)
  end


end