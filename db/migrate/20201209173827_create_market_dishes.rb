class CreateMarketDishes < ActiveRecord::Migration[6.0]
  def change
    create_table :market_dishes do |t|
      t.belongs_to :user, foreign_key: true
      t.belongs_to :user_dish, foreign_key: true
      t.integer :market_dish_type
      t.timestamps
    end
  end
end
