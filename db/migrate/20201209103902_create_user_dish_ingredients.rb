class CreateUserDishIngredients < ActiveRecord::Migration[6.0]
  def change
    create_table :user_dish_ingredients do |t|
      t.belongs_to :user_dish, foreign_key: true
      t.belongs_to :ingredient, foreign_key: true
      t.timestamps
    end
  end
end
