class Tag < ApplicationRecord
  has_many :user_dish_tags
  has_many :user_dishes, through: :user_dish_tags
end
