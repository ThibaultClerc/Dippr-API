class AddColumnToUserDishes < ActiveRecord::Migration[6.0]
  def change
    add_reference :user_dishes, :user, foreign_key: true
  end
end
