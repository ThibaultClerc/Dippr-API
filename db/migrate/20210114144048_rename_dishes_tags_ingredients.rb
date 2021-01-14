class RenameDishesTagsIngredients < ActiveRecord::Migration[6.0]
  def up
    rename_table :dishes_tags, :dish_tags
    rename_table :dishes_ingredients, :dish_ingredients
  end

  def down
    rename_table :dish_tags, :dishes_tags
    rename_table :dish_ingredients, :dishes_ingredients
  end
end
