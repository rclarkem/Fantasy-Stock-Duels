# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
StockPick.destroy_all
Battle.destroy_all
Stock.destroy_all
User.destroy_all
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

30.times do 
    User.create(name: Faker::Name.unique.name, username: Faker::TvShows::StarTrek.character, email: Faker::Internet.email, password: Faker::Hacker.noun, about_me: Faker::TvShows::TheFreshPrinceOfBelAir.quote, photo_url: Faker::Avatar.image)
end

30.times do
    value = rand(50..1000)
    quantity = rand(100..5000)
    Stock.create(name: Faker::Company.name, ticker: Faker::Hacker.abbreviation, initial_value: value, current_value: value, initial_quantity: quantity, current_quantity: quantity)
end

User.all.map do |user|
    amount = rand(1..5)
    Stock.all.sample(amount).map do |stock|
    quantity = rand(2..100)
        StockPick.create(user: user, stock: stock, quantity: quantity, value: stock.initial_value * quantity)
    end
end

30.times do 
    battle = Battle.create(player1: User.all.sample, player2: User.all.sample)
    battle.generator
end

puts "It's been seeded"