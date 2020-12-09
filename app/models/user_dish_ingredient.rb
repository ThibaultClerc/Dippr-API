class UserDishIngredient < ApplicationRecord
  belongs_to :ingredient
  belongs_to :user_dish
end
