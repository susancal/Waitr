# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first

Restaurant.create!(name: "DemoRestaurant", email:"demo@demo.com", password: "password")

Party.create!(restaurant_id: 1, name: "Smith", size: 2, cell: "8882345678", key: "123456", in_queue: true, points_earned: 0)
Party.create!(restaurant_id: 1, name: "Jones", size: 2, cell: "8889876543", key: "098765", in_queue: true, points_earned: 0)

Quiz.create!

Question.create!(question_text: "The color that is made by mixing red and blue.", answer: "purple", quiz_id: 1, value: 200)
Question.create!(question_text: "The animal that barks and has four legs.", answer: "dog", quiz_id: 1, value: 200)
Question.create!(question_text: "The brass instrument with the lowest range.", answer: "tuba", quiz_id: 1, value: 200)
Question.create!(question_text: "The capital of Illinois.", answer: "Springfield", quiz_id: 1, value: 200)
Question.create!(question_text: "The yellow condiment commonly found on hotdogs.", answer: "mustard", quiz_id: 1, value: 200)
