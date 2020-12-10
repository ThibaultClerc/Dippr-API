class MarketDish < ApplicationRecord
  include  PgSearch::Model
  pg_search_scope :search_by_term,
    associated_against: {
      user_dish: :name,
      tags: :name,
      ingredients: :name
    },
    using: { 
      tsearch: { 
        any_word: true,
        prefix: true
      }
    }

  enum market_dish_type: [:troc, :donation]

  belongs_to :user
  belongs_to :user_dish
  has_many :tags, through: :user_dish
  has_many :ingredients, through: :user_dish
end