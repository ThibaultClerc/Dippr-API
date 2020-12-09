class Ingredient < ApplicationRecord
  has_many :user_dish_ingredients
  has_many :user_dishes, through: :user_dish_ingredients
end
