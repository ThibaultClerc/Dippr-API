class DropUselessTables < ActiveRecord::Migration[6.0]
  def down
    rename_table :dishes, :user_dishes
    create_table :user_dish_ingredients do |t|
      t.belongs_to :user_dish,  foreign_key: true
      t.belongs_to :ingredient, foreign_key: true
      t.timestamps
    end
    create_table :user_dish_tags do |t|
      t.belongs_to :user_dish, foreign_key: true
      t.belongs_to :tag, foreign_key: true
      t.timestamps
    end
    create_table :market_dishes do |t|
      t.belongs_to :user_dish, foreign_key: true
      t.integer :market_dish_type
      t.boolean :is_private
      t.datetime :end_date, null: false
      t.timestamps
    end
  end

  def up
    drop_table :user_dish_ingredients
    drop_table :user_dish_tags
    drop_table :market_dishes
  end
end
