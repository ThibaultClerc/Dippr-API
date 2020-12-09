class MarketDish < ApplicationRecord
  enum market_dish_type: [:troc, :donation]

  belongs_to :user
  belongs_to :user_dish
end
