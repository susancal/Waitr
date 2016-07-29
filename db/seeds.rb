# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first


Restaurant.create!(name: "The Matte Bakery", email:"matt@baker.com", password: "password")
Restaurant.create!(name: "Susie's diner", email:"susie@susies.com", password: "password")

Party.create!(restaurant_id: 1, name: "Smiths", size: 2, cell: "7738958335", in_queue: true, points_earned: 0)
Party.create!(restaurant_id: 1, name: "Maxwell", size: 4, cell: "7734562334", in_queue: true, points_earned: 1000)
Party.create!(restaurant_id: 1, name: "Johnson", size: 8, cell: "7739050234", in_queue: true, points_earned: 2000)
Party.create!(restaurant_id: 1, name: "Fonzi", size: 2, cell: "7736243333", in_queue: true, points_earned: 500)
#   Character.create(name: 'Luke', movie: movies.first)

Quiz.create!

Question.create!(question_text: "The type of bird that shares the name of the greatest DBC cohort.", answer: "nighthawk", quiz_id: 1, value: 200)
Question.create!(question_text: "The medieval sport that is reenacted every evening at DBC.", answer: "swordfighting", quiz_id: 1, value: 200)
Question.create!(question_text: "The dreaded activity performed every Thursday after lunch at DBC.", answer: "cleaning", quiz_id: 1, value: 200)
Question.create!(question_text: "The instrument used to tell time at DBC.", answer: "gong", quiz_id: 1, value: 200)
Question.create!(question_text: "Name three cities in Iceland.", answer: "nobody knows", quiz_id: 1, value: 200)



# api = Triviaapi.new
# api.seed_db

# Round.create!(quiz_id: 1, party_id: 1, secret_key: 123456)

# Round.create!(quiz_id: 1, party_id: 2, secret_key: 123456)

