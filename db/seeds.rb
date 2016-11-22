# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


u1 = User.create(email: "123@123.com", password: "123")
Bracket.create(game_name: "Smash", description: "10 player smash tournament @ Bitmaker 3rd floor", admin: "123@123.com", started: false)
Bracket.create(game_name: "Mario Kart", description: "14 player mariokart tournament @ Bitmaker 3rd floor", admin: "123@123.com", started: false)
Bracket.create(game_name: "Halo 1", description: "20 player Halo tournament @ Bitmaker 3rd floor", admin: "123@123.com")
Bracket.create(game_name: "Halo 2", description: "21 player smash tournament @ Bitmaker 3rd floor. Bring your own controller", admin: "123@123.com", started: false)
Bracket.create(game_name: "Halo 3", description: "6 player Halo tournament", admin: "123@123.com", started: false)
Bracket.create(game_name: "Smash Brawl", description: "30 player Smash Brawl tournament @ Bitmaker 3rd floor", admin: "123@123.com", started: false)
Bracket.create(game_name: "Counter Strike GO", description: "12 player smash tournament @ Bitmaker 3rd floor", admin: "123@123.com", started: false)
array_of_users = [
  User.create(email: "1@1.com", password: "123"),
  User.create(email: "2@2.com", password: "123"),
  User.create(email: "3@3.com", password: "123"),
  User.create(email: "4@4.com", password: "123"),
  User.create(email: "5@5.com", password: "123"),
  User.create(email: "6@6.com", password: "123"),
  User.create(email: "7@7.com", password: "123"),
  User.create(email: "8@8.com", password: "123"),
  User.create(email: "11@1.com", password: "123"),
  User.create(email: "21@2.com", password: "123"),
  User.create(email: "31@3.com", password: "123"),
  User.create(email: "41@4.com", password: "123"),
  User.create(email: "51@5.com", password: "123"),
  User.create(email: "61@6.com", password: "123"),
  User.create(email: "71@7.com", password: "123"),
  User.create(email: "81@8.com", password: "123")
]
array_of_users.each do |user|
  Bracket.find_by(id: 1).users << user
end
