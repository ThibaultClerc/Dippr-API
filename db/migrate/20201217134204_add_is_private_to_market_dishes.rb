class AddIsPrivateToMarketDishes < ActiveRecord::Migration[6.0]
  def change
    add_column :market_dishes, :is_private, :boolean, null: false
  end
end
