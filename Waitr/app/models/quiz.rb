class Quiz < ApplicationRecord
  has_many :questions

  validates :seconds_per_question, presence: true



end
