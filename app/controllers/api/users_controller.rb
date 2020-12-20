class Api::UsersController < ApplicationController
  before_action :find_user, only: [:show, :update]
  before_action :authenticate_user!, only: [:show, :update, :index]

  def index
    @users = User.all
    render jsonapi: @users
  end

  def show
    render_jsonapi_response(@user)
  end

  def update
    if current_user.id === @user.id || current_user.is_admin === true
      if @user.update(user_params)
        render json: @user
      elsif file_params[:file]
        @user.avatar.attach(file_params[:file])
        avatar_url = rails_blob_path(@user.avatar, only_path: true)
      elsif @user.update(avatar_url: avatar_url)
        render json: @user
      else
        render json: @user.errors, status: :unprocessable_entity
      end
    end
  end

  private

  def find_user
    @user = User.find(params[:id])
  end

  def user_params
    params.permit(:id, :email, :first_name, :last_name, :password, :country, :city, :street, :zip_code, :description, :phone_number, :nickname)
  end

  def avatar_params
    params.permit(:file)
  end

end