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

  belongs_to :user_dish
  has_many :trocs, foreign_key: "caller_dish_id", class_name: "Troc"
  has_many :trocs, foreign_key: "answer_dish_id", class_name: "Troc"
  has_many :donations, foreign_key: "answer_dish_id", class_name: "Donation"
  has_many :tags, through: :user_dish
  has_many :ingredients, through: :user_dish
end
