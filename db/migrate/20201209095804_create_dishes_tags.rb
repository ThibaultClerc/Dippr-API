class CreateDishesTags < ActiveRecord::Migration[6.0]
  def change
    create_table :dishes_tags do |t|
      t.belongs_to :user_dish, foreign_key: true
      t.belongs_to :tag, foreign_key: true
    end
  end
end
