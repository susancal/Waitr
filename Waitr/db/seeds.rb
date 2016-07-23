# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first


Restaurant.create!(name: "Susie's diner", email:"susie@susies.com", password: "password")
Party.create!(restaurant_id: 1, name: "Smiths", size: 2, cell: "7738958335", in_queue: true, points_earned: 0)
Party.create!(restaurant_id: 1, name: "Maxwell", size: 4, cell: "7734562334", in_queue: true, points_earned: 1000)
Party.create!(restaurant_id: 1, name: "Johnson", size: 8, cell: "7739050234", in_queue: true, points_earned: 2000)
Party.create!(restaurant_id: 1, name: "Fonzi", size: 2, cell: "7736243333", in_queue: true, points_earned: 500)
#   Character.create(name: 'Luke', movie: movies.first)

# Restaurant.create(name: "WPE", email: "few@few", password_digest: "hi")

# Party.create(restaurant_id: 1, name: "Fonzi", size: 2, cell: "4002919203", in_queue: true, points_earned: 0)
# Party.create(restaurant_id: 1, name: "Fonzi2", size: 12, cell: "4002923203", in_queue: true, points_earned: 0)
# Party.create(restaurant_id: 1, name: "Fonzi3", size: 4, cell: "4002123453", in_queue: true, points_earned: 0)
# Party.create(restaurant_id: 1, name: "Fonzi4", size: 6, cell: "4002954323", :in_queue => true, points_earned: 0)
# Party.create(restaurant_id: 1, name: "Fonzi5", size: 6, cell: "4002954321", :in_queue => false, points_earned: 0)

api = Triviaapi.new
api.seed_db
