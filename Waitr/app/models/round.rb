class Round < ApplicationRecord
  has_many :guesses
  belongs_to :quiz

  belongs_to :party_one, foreign_key: 'party_one_id', class_name: "Party"
  # belongs_to :party_two, foreign_key: 'party_two_id', class_name: "Party"

end
