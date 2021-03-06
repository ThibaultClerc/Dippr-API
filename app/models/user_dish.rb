class UserDish < ApplicationRecord
  has_one_attached :photo
  belongs_to :user
  has_many :user_dish_tags
  has_many :tags, through: :user_dish_tags
  has_many :user_dish_ingredients
  has_many :ingredients, through: :user_dish_ingredients
  has_many :market_dishes
end
