class Quiz < ApplicationRecord
  has_many :questions

  validates :title, presence: true
  validates :seconds_per_question, presence: true



end
