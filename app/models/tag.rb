class Tag < ApplicationRecord
  has_many :dish_tags
  has_many :dish, through: :dish_tags
end
