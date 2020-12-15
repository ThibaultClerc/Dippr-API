class Api::UserDishesController < ApplicationController
  before_action :set_user_dish, only: [:show, :update, :destroy]

  # GET /user_dishes
  def index
    if user_dish_params.include?(:user_id)
      @user_dishes = User.find(user_dish_params[:user_id]).user_dishes
    else
      @user_dishes = UserDish.all
    end
    render jsonapi: @user_dishes
  end

  # GET /user_dishes/1
  def show
    render jsonapi: @user_dish
  end

  # POST /user_dishes
  def create
    @user_dish = UserDish.new(user_dish_params)
    @user_dish.user_id = current_user.id
    # if user_dish_params[:file]
    #   @user_dish.photo.attach(user_dish_params[:file])
    #   photo = url_for(@user_dish.photo)
    # elsif user_dish_params[:camera]
    #   blob = ActiveStorage::Blob.create_after_upload!(
    #     io: StringIO.new((Base64.decode64(user_dish_params[:camera].split(",")[1]))),
    #     filename: `#{user_dish_params[:user_id]}_#{user_dish_params[:id]}.png`,
    #     content_type: "image/png",
    #   )
    #   @user_dish.photo.attach(blob)
    #   photo = url_for(@user_dish.photo)
    # end
    if @user_dish.save
      render jsonapi: @user_dish, status: :created
    else
      render jsonapi: @user_dish.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /user_dishes/1
  def update
    if user_dish_params[:file]
      @user_dish.photo.attach(user_dish_params[:file])
      photo = url_for(@user_dish.photo)
    elsif user_dish_params[:camera]
      blob = ActiveStorage::Blob.create_after_upload!(
        io: StringIO.new((Base64.decode64(user_dish_params[:camera].split(",")[1]))),
        filename: `#{user_dish_params[:user_id]}_#{user_dish_params[:id]}.png`,
        content_type: "image/png",
      )
      @user_dish.photo.attach(blob)
      photo = url_for(@user_dish.photo)
    end
    if @user_dish.update(user_dish_params) && @user_dish.update(photo: photo)
      render json: @user_dish
    else
      render json: @user_dish.errors, status: :unprocessable_entity
    end
  end

  # DELETE /user_dishes/1
  def destroy
    @user_dish.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user_dish
      @user_dish = UserDish.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def user_dish_params
      params.permit(:id, :name, :description, :photo, :user_id, :dish_rating)
    end

end
