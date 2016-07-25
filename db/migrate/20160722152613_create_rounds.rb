class CreateRounds < ActiveRecord::Migration[5.0]
  def change
    create_table :rounds do |t|
      t.integer :quiz_id
      t.integer :party_id, null: false
      t.integer :party_score, default: 0
      t.integer :secret_key
      t.integer :player_num

      t.timestamps
    end
  end
end

# players = Waitingroom.first(2)
# rnd_key = match_key
# random_q = rand(1..30)
# Round.create(quiz_id: random_q, secret_key: rnd_key, party_id: players[0].id, player_num: 1)
# Round.create(quiz_id: random_q, secret_key: rnd_key, party_id: players[1].id, player_num: 2)







# def match_key
#   self.key = [*"0".."9"].sample(6).join
# end


