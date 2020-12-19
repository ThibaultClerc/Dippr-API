class AddColumnsToTrocs < ActiveRecord::Migration[6.0]
  def change
    add_reference :trocs, :caller, foreign_key: { to_table: :users }
    add_reference :trocs, :answerer, foreign_key: { to_table: :users }
  end
end
