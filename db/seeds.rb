# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
StockPick.destroy_all
Stock.destroy_all
User.destroy_all
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


user1 = User.create(name: "Reina", username: "RC", email: "reina@gmail.com", password_digest: "password", about_me: "I go to Flatiron", photo_url: "https://images.pexels.com/photos/45201/kitty-cat-kitten-pet-45201.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500")
user2 = User.create(name: "Jamal", username: "Jamalino", email: "jamal@gmail.com", password_digest: "123456", about_me: "I'm super cool", photo_url: "https://images.pexels.com/photos/45201/kitty-cat-kitten-pet-45201.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500")
user3 = User.create(name: "Gaida", username: "Coder123", email: "gaida@gmail.com", password_digest: "654321", about_me: "I love Jamal", photo_url: "https://images.pexels.com/photos/45201/kitty-cat-kitten-pet-45201.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500")
user4 = User.create(name: "Ethan", username: "EthanJF", email: "ethan@gmail.com", password_digest: "p@ssw0rd", about_me: "I love coding", photo_url: "https://images.pexels.com/photos/45201/kitty-cat-kitten-pet-45201.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500")

stock1 = Stock.create(name: "Apple", ticker: "AAPL", initial_value: 240, current_value: 240, initial_quantity: 5000, current_quantity: 5000)
stock2 = Stock.create(name: "Netflix", ticker: "NFLX", initial_value: 278, current_value: 278, initial_quantity: 1000, current_quantity: 1000)
stock3 = Stock.create(name: "Facebook", ticker: "FB", initial_value: 189, current_value: 189, initial_quantity: 500, current_quantity: 500)
stock4 = Stock.create(name: "Google", ticker: "GOOG", initial_value: 1246, current_value: 1246, initial_quantity: 10000, current_quantity: 10000)

stockpick2 = StockPick.create(user: user2, stock: stock2, quantity: 1, value: 278)
stockpick1 = StockPick.create(user: user1, stock: stock1, quantity: 2, value: 480)
stockpick3 = StockPick.create(user: user3, stock: stock3, quantity: 4, value: (stock3.initial_value * 3))
stockpick4 = StockPick.create(user: user4, stock: stock4, quantity: 10, value: (stock4.initial_value * 10))
