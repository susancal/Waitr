class Round < ApplicationRecord
  has_many :guesses
  belongs_to :quiz
  belongs_to :party

  # belongs_to :party_one, foreign_key: 'party_one_id', class_name: "Party"


  def completed?
   self.guesses.any?
 end

 def self.waiting_rounds
   return Round.all.where(party_two_id: nil)
 end

 def self.first_waiting_round
   arr = []
   waiting_rounds.each do |round|
     if !round.completed?
       arr << round.id
     end
   end
   return arr.shift
 end

end
