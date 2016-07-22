class CreateGuesses < ActiveRecord::Migration[5.0]
  def change
    create_table :guesses do |t|
      t.references :party
      t.references :question
      t.references :round
      t.string :status, presence: true, default: "none"
      t.string :guess_value

      t.timestamps
    end
  end
end
