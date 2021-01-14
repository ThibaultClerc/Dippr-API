class Api::DishesController < ApplicationController
  before_action :set_dish, only: [:show, :update, :destroy]
  before_action :authenticate_user!, only: [:create, :destroy]

  # GET /dishes
  def index
    if dish_params.include?(:user_id)
      @dishes = User.find(dish_params[:user_id]).dishes
    else
      @dishes = Dish.all
    end
    render jsonapi: @dishes
  end

  # GET /dishes/1
  def show
    render jsonapi: @dish
  end

  # POST /dishes
  def create
    @dish = Dish.new(dish_params)
    @dish.user_id = current_user.id
    if file_params[:file]
      @dish.photo.attach(file_params[:file])
      @dish.photo_url = rails_blob_path(@dish.photo, only_path: true)
    end
    if @dish.save
      render jsonapi: @dish, status: :created
    else
      render jsonapi: @dish.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /dishes/1
  def update
    if file_params[:file]
      @dish.photo.attach(file_params[:file])
      photo_url = rails_blob_path(@dish.photo, only_path: true)
    end
    if @dish.update(photo_url: photo_url)
      render json: @dish
    else
      render json: @dish.errors, status: :unprocessable_entity
    end
  end

  # DELETE /dishes/1
  def destroy
    @dish = Dish.find(dish_params[:id])
    if current_user.id === @dish.user.id
      @dish.destroy
    end
  end

  def search
    @dishes = Dish.search_by_term(query_params[:query])
    render jsonapi: @dishes
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_dish
      @dish = Dish.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def dish_params
      params.permit(:id, :name, :description, :user_id, :dish_rating, :photo_url)
    end

    def file_params
      params.permit(:file)
    end

    def query_params
      params.permit(:query)
    end
end