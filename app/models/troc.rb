class Troc < ApplicationRecord
  enum status: [:pending, :confirmed, :refused, :cancelled, :finished]

  belongs_to :caller_dish,   class_name: "Dish"
  belongs_to :answer_dish, class_name: "Dish"
  belongs_to :caller,   class_name: "User"
  belongs_to :answerer,   class_name: "User"
end
