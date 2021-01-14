class UpdateForeignKeysUserDishes < ActiveRecord::Migration[6.0]
  def up
    remove_column :dishes_ingredients, :user_dish_id, :bigint
    remove_column :dishes_tags, :user_dish_id, :bigint
    remove_column :trocs, :caller_dish_id, :bigint
    remove_column :trocs, :answer_dish_id, :bigint
    remove_column :donations, :answer_dish_id, :bigint

    add_reference :dishes_ingredients, :dish, foreign_key: { to_table: :dishes }
    add_reference :dishes_tags, :dish, foreign_key: { to_table: :dishes }
    add_reference :trocs, :caller_dish, foreign_key: { to_table: :dishes }
    add_reference :trocs, :answer_dish, foreign_key: { to_table: :dishes }
    add_reference :donations, :answer_dish, foreign_key: { to_table: :dishes }
  end

  def down
    remove_column :dishes_ingredients, :dish_id, :bigint
    remove_column :dishes_tags, :dish_id, :bigint
    remove_column :trocs, :caller_dish_id, :bigint
    remove_column :trocs, :answer_dish_id, :bigint
    remove_column :donations, :answer_dish_id, :bigint

    add_reference :dishes_ingredients, :user_dish, foreign_key: { to_table: :user_dishes }
    add_reference :dishes_tags, :user_dish, foreign_key: { to_table: :user_dishes }
    add_reference :trocs, :caller_dish, foreign_key: { to_table: :user_dishes }
    add_reference :trocs, :answer_dish, foreign_key: { to_table: :user_dishes }
    add_reference :donations, :answer_dish, foreign_key: { to_table: :user_dishes }
  end
end
