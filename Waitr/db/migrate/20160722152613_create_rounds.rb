class CreateRounds < ActiveRecord::Migration[5.0]
  def change
    create_table :rounds do |t|
      t.integer :quiz_id
      t.integer :party_one_id, null: false
      t.integer :party_two_id, default: 0
      t.integer :party_one_score, default: 0
      t.integer :party_two_score, default: 0

      t.timestamps
    end
  end
end
