class Quiz < ApplicationRecord
  has_many :questions
  has_many :rounds

  validates :seconds_per_question, presence: true
  def select_question
    # need to refine to select only questions that do not have prior associated guesses
    questions = self.questions
    length = questions.length
    randnum = rand(length)
    questions[randnum]
    # need to define some question
  end


end
