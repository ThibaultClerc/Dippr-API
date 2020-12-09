class UserDishTag < ApplicationRecord
  belongs_to :tag
  belongs_to :user_dish
end
