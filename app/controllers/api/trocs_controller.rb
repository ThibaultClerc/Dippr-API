class Api::TrocsController < ApplicationController
  before_action :authenticate_user!

  def index
    if user_params.include?(:user_id)
      @trocs = User.find(user_params[:user_id]).trocs
    else
      @trocs = Troc.all
    end
    render jsonapi: @trocs
  end

  def show
    @troc = Troc.find(troc_params[:id])
    render jsonapi: @troc
  end

  def create
    @user_trocs = User.find(current_user.id).trocs
    if !Troc.exists?(caller_id: current_user.id, answerer_id: troc_params[:answerer_id], status: 0) || !Troc.exists?(caller_id: current_user.id, answerer_id: troc_params[:answerer_id], status: 1)
      @troc = Troc.new(troc_params)
      @troc.caller_id = current_user.id
      if @troc.save
        render jsonapi: @troc, status: :created
      else
        render jsonapi: @troc.errors, status: :unprocessable_entity
      end
    else
      render jsonapi: { message: 'Troc for this dish has already been asked' }, status: :internal_server_error
    end
  end

  def update
    @troc = Troc.find(troc_params[:id])
    if @troc.pending? || @troc.confirmed?
      if @troc.update(status: troc_params[:status])
        render json: @troc
      else
        render json: @troc.errors, status: :unprocessable_entity
      end
    end
  end

  private

  def troc_params
    params.permit(:id, :answer_dish_id, :caller_dish_id, :answerer_id, :status)
  end

  def user_params
    params.permit(:user_id)
  end

end
