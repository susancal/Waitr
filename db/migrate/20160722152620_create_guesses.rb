class CreateGuesses < ActiveRecord::Migration[5.0]
  def change
    create_table :guesses do |t|
      t.integer :party_id
      t.integer :question_id
      t.integer :round_id
      t.string :key_number
      t.string :status, presence: true, default: "none"
      t.string :guess_value

      t.timestamps
    end
  end
end
