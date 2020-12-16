class CreateDishesIngredients < ActiveRecord::Migration[6.0]
  def change
    create_table :dishes_ingredients do |t|
      t.belongs_to :user_dish, foreign_key: true
      t.belongs_to :ingredient, foreign_key: true
    end
  end
end
