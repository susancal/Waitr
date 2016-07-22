class Party < ApplicationRecord
  has_many :guesses
  has_many :rounds
end
