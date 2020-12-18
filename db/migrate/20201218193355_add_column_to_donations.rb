class AddColumnToDonations < ActiveRecord::Migration[6.0]
  def change
    add_reference :donations, :answerer, foreign_key: { to_table: :users }
  end
end
