# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
# require 'rest-client'
# require 'json'
# Examples:
StockPick.destroy_all
Battle.destroy_all
Stock.destroy_all
User.destroy_all
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

30.times do 
    rand_wealth = rand(5000..10000)
    User.create(name: Faker::Name.unique.name, username: Faker::TvShows::StarTrek.character, email: Faker::Internet.email, password: Faker::Hacker.noun, wealth: rand_wealth, about_me: Faker::Movies::PrincessBride.quote, photo_url: Faker::Avatar.image)
end

30.times do
    value = rand(50..200)
    quantity = rand(100..500)
    Stock.create(name: Faker::Company.name, ticker: Faker::Hacker.abbreviation, initial_value: value, current_value: value, initial_quantity: quantity, current_quantity: quantity)
end

100.times do
    shares_amount = rand(5..25)
    stock_chosen = Stock.all.sample
    StockPick.create(user: User.all.sample, stock: stock_chosen, quantity: shares_amount, value: stock_chosen.initial_value * shares_amount)
end

15.times do 
    battle = Battle.create(player1: User.all.sample, player2: User.all.sample)
    battle.generator
end

puts "It's been seeded"
