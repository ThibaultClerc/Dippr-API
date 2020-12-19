class AddEndDateToMarketDishes < ActiveRecord::Migration[6.0]
  def change
    add_column :market_dishes, :end_date, :datetime, null: false
  end
end
