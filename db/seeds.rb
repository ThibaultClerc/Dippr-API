# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'
Faker::Config.locale = 'fr'
include Rails.application.routes.url_helpers

ingredients = JSON.parse(File.read('db/data/ingredients.JSON'))
ingredients.map { |ingredient| Ingredient.create!(name: ingredient.downcase) }

puts "#{Ingredient.all.count} ingrédients créés"

tags = ["sucré", "salé", "sucré-salé", "entrée", "plat", "dessert", "gâteau", "cake", "vegan", "végétarien", "chaud", "froid", "viande", "accompagnement", "amuses-bouches", "cuisine orientale", "cuisine asiatique", "cuisine africaine", "cuisine antillaise", "cuisine française"]
tags.map { |tag| Tag.create!(name: tag)}

puts "#{Tag.all.count} tags créés"

10.times do |i|
  User.create!(
    email: Faker::Internet.email,
    password: "azerty",
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    city: Faker::Address.city,
    street: Faker::Address.street_name,
    country: "France",
    zip_code: Faker::Address.zip_code,
    description: Faker::Hipster.paragraph,
    dippers: rand(1..10),
    user_rating: rand(1..5),
    phone_number: Faker::PhoneNumber.phone_number,
    lat: rand(48.810000..48.830000),
    lng: rand(2.340000..2.350000)

  )
  2.times do |k|
    Dish.create!(
      name: Faker::Food.dish,
      description: Faker::Lorem.paragraph,
      user_id: i + 1,
      dish_rating: rand(1..5)
    )
    img = "app/assets/images/examplePhoto.jpg"
    Dish.last.photo.attach(
      io: File.open(img),
      filename: File.basename(img)
    )
    Dish.last.update(photo_url: rails_blob_path(Dish.last.photo, only_path: true))
    3.times do |j|
      DishTag.create!(
        dish_id: Dish.last.id,
        tag_id: Tag.find(rand(1..20)).id
      )
      DishIngredient.create!(
        dish_id: Dish.last.id,
        ingredient_id: Ingredient.find(rand(1..2253)).id
      )
    end
  end
end


puts "#{User.all.count} users créés"
puts "#{Dish.all.count} plats créés"

caller_id = 1
answerer_id = 6
caller_dish_id = 1
answer_dish_id = 11
5.times do |i|
  Troc.create!(
    caller_id: caller_id,
    answerer_id: answerer_id,
    caller_dish_id: caller_dish_id,
    answer_dish_id: answer_dish_id,
    status: rand(0..4)
  )
  caller_id += 1
  answerer_id += 1
  caller_dish_id += 1
  answer_dish_id += 1
end

puts "#{Troc.all.count} trocs créés"

caller_donation_id = 1
answer_dish_donation_id = 11
answerer_donation_id = 6
5.times do |i|
  Donation.create!(
    caller_id: caller_donation_id,
    answerer_id: answerer_donation_id,
    answer_dish_id: answer_dish_donation_id,
    status: rand(0..4)
  )
  answer_dish_donation_id += 1
  caller_donation_id += 1
  answerer_donation_id += 1
end

puts "#{Donation.all.count} dons créés"

puts "SEED DONE"
