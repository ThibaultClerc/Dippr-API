class Dish < ApplicationRecord
  include  PgSearch::Model
  pg_search_scope :search_by_term,
    associated_against: {
      tags: :name,
      ingredients: :name
    },
    using: { 
      tsearch: { 
        any_word: true,
        prefix: true
      }
    }

  has_one_attached :photo
  belongs_to :user
  has_many :trocs, foreign_key: "caller_dish_id", class_name: "Troc"
  has_many :trocs, foreign_key: "answer_dish_id", class_name: "Troc"
  has_many :donations, foreign_key: "answer_dish_id", class_name: "Donation"
  has_many :dish_tags
  has_many :tags, through: :dish_tags
  has_many :dish_ingredients
  has_many :ingredients, through: :dish_ingredients
end
