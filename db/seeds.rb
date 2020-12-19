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
    UserDish.create!(
      name: Faker::Food.dish,
      description: Faker::Lorem.paragraph,
      user_id: i + 1,
      dish_rating: rand(1..5)
    )
    img = "app/assets/images/examplePhoto.jpg"
    UserDish.last.photo.attach(
      io: File.open(img),
      filename: File.basename(img)
    )
    UserDish.last.update(photo_url: rails_blob_path(UserDish.last.photo, only_path: true))
    3.times do |j|
      UserDishTag.create!(
        user_dish_id: UserDish.last.id,
        tag_id: Tag.find(rand(1..20)).id
      )
      UserDishIngredient.create!(
        user_dish_id: UserDish.last.id,
        ingredient_id: Ingredient.find(rand(1..2253)).id
      )
    end
    MarketDish.create(
    user_dish_id: UserDish.last.id,
    market_dish_type: 0,
    end_date: Faker::Date.forward(days: 14),
    is_private: [true, false].sample
    )
    MarketDish.create(
      user_dish_id: UserDish.last.id,
      market_dish_type: 1,
      end_date: Faker::Date.forward(days: 14),
      is_private: false
    )
  end
end


puts "#{User.all.count} users créés"
puts "#{UserDish.all.count} plats créés"
puts "#{MarketDish.all.count} plats mis sur le marché"

caller_id = 1
answerer_id = 6
caller_dish_id = 1
answer_dish_id = 21
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
  caller_dish_id += 2
  answer_dish_id += 2
end

puts "#{Troc.all.count} trocs créés"

answer_dish_donation_id = 12
caller_donation_id = 1
answerer_donation_id = 6
5.times do |i|
  Donation.create!(
    answerer_id: answerer_donation_id,
    caller_id: caller_donation_id,
    answer_dish_id: answer_dish_donation_id,
    status: rand(0..4)
  )
  answer_dish_donation_id += 2
  caller_donation_id += 1
  answerer_donation_id += 1
end

puts "#{Donation.all.count} dons créés"

puts "SEED DONE"
