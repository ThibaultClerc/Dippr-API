class Api::UserDishesController < ApplicationController
  def index
    @userdishes = UserDish.all
    render jsonapi: @userdishes
  end

end
