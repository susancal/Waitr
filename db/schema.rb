# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20160725225028) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "guesses", force: :cascade do |t|
    t.integer  "party_id"
    t.integer  "question_id"
    t.integer  "round_id"
    t.string   "status",      default: "none"
    t.string   "guess_value"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

  create_table "keys", force: :cascade do |t|
    t.string  "key"
    t.integer "quiz_id"
  end

  create_table "parties", force: :cascade do |t|
    t.integer  "restaurant_id"
    t.string   "name",                         null: false
    t.string   "key"
    t.integer  "size",                         null: false
    t.string   "cell",                         null: false
    t.boolean  "in_queue",      default: true
    t.integer  "points_earned", default: 0
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

  create_table "prizes", force: :cascade do |t|
    t.integer  "restaurant_id"
    t.integer  "points_needed", null: false
    t.string   "prize_name",    null: false
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "questions", force: :cascade do |t|
    t.string   "question_text", null: false
    t.string   "answer",        null: false
    t.integer  "quiz_id"
    t.integer  "value",         null: false
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "quizzes", force: :cascade do |t|
    t.integer  "seconds_per_question", default: 15
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
  end

  create_table "restaurants", force: :cascade do |t|
    t.string   "name",            null: false
    t.string   "email",           null: false
    t.string   "password_digest", null: false
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "rounds", force: :cascade do |t|
    t.integer  "quiz_id"
    t.integer  "party_id",                null: false
    t.integer  "party_score", default: 0
    t.integer  "secret_key"
    t.integer  "player_num"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "waitingrooms", force: :cascade do |t|
    t.integer  "restaurant_id"
    t.integer  "party_id"
    t.integer  "party_key"
    t.string   "key"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

end
