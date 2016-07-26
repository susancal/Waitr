class CreateRounds < ActiveRecord::Migration[5.0]
  def change
    create_table :rounds do |t|
      t.integer :quiz_id
      t.integer :party_id, null: false
      t.integer :party_score, default: 0
      t.integer :secret_key
      t.integer :player_num
      t.boolean :ready_to_play

      t.timestamps
    end
  end
end
