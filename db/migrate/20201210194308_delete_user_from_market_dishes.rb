class DeleteUserFromMarketDishes < ActiveRecord::Migration[6.0]
  def change
    remove_reference :market_dishes, :user, foreign_key: true
  end
end
