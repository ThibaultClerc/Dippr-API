class CreateUserDishes < ActiveRecord::Migration[6.0]
  def change
    create_table :user_dishes do |t|
      t.string :name
      t.text :description
      t.integer :dish_rating
      t.timestamps
    end
  end
end
