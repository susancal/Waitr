class Guess < ApplicationRecord
  belongs_to :question
  belongs_to :party
  belongs_to :round

  validates :party_id, presence: true
  validates :question_id, presence: true
  validates :status, presence: true



end
