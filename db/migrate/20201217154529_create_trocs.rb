class CreateTrocs < ActiveRecord::Migration[6.0]
  def change
    create_table :trocs do |t|
      t.belongs_to :caller_dish,   foreign_key: { to_table: :market_dishes }
      t.belongs_to :answer_dish, foreign_key: { to_table: :market_dishes }
      t.integer :status
      t.timestamps
    end
  end
end
