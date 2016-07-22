class Question < ApplicationRecord
  belongs_to :quiz
  has_many :guesses

  validates :question_text, presence: true, uniqueness: true
  validates :answer, presence: true
  validates :value, presence: true
  validates :quiz_id, presence: true




end
