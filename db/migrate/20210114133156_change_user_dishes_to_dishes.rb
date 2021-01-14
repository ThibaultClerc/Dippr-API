class ChangeUserDishesToDishes < ActiveRecord::Migration[6.0]
  def up
    rename_table :user_dishes, :dishes
  end
end
