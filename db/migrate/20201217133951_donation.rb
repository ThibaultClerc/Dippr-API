class Donation < ActiveRecord::Migration[6.0]
  def change
    create_table :donations do |t|
      t.references :caller,        foreign_key: { to_table: :users }
      t.references :answer_dish,   foreign_key: { to_table: :market_dishes }
      t.integer :status
      t.timestamps
    end
  end
end
