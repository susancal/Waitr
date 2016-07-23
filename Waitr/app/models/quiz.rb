class Quiz < ApplicationRecord
  has_many :questions

  validates :seconds_per_question, presence: true
  def select_question
    # need to refine to select only questions that do not have prior associated guesses
    questions = self.questions
    length = questions.length
    randnum = rand(length)
    questions[randnum]
  end


end
