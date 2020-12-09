# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'
Faker::Config.locale = 'fr'

ingredients = JSON.parse(File.read('db/data/ingredients.JSON'))
ingredients.map { |ingredient| Ingredient.create!(name: ingredient.downcase) }

puts "#{Ingredient.all.count} ingrédients créés"

tags = ["sucré", "salé", "sucré-salé", "entrée", "plat", "dessert", "gâteau", "cake", "vegan", "végétarien", "chaud", "froid", "viande", "accompagnement", "amuses-bouches", "cuisine orientale", "cuisine asiatique", "cuisine africaine", "cuisine antillaise", "cuisine française"]
tags.map { |tag| Tag.create!(name: tag)}

puts "#{Tag.all.count} tags créés"

6.times do |i|
  UserDish.create!(
    name: Faker::Food.unique.dish,
    description: Faker::Lorem.paragraph
  )
  3.times do |j|
    UserDishTag.create!(
      user_dish_id: i + 1,
      tag_id: Tag.find(rand(1..20)).id
    )
    UserDishIngredient.create!(
      user_dish_id: i + 1,
      ingredient_id: Ingredient.find(rand(1..2253)).id
    )
  end
end

puts "#{UserDish.all.count} plats créés"
