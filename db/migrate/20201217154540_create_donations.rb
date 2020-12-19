class CreateDonations < ActiveRecord::Migration[6.0]
  def change
    create_table :donations do |t|
      t.belongs_to :caller,        foreign_key: { to_table: :users }
      t.belongs_to :answer_dish,   foreign_key: { to_table: :market_dishes }
      t.integer :status
      t.timestamps
    end
  end
end
