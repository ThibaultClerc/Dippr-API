class Troc < ApplicationRecord
  enum status: [:pending, :confirmed, :refused, :cancelled, :finished]

  belongs_to :caller_dish,   class_name: "MarketDish"
  belongs_to :answer_dish, class_name: "MarketDish"
end
