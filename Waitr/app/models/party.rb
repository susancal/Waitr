class Party < ApplicationRecord
  has_many :guesses
  has_many :rounds
  belongs_to :restaurant

  validates :restaurant_id, presence: true
  validates :name, presence: true
  validates :size, presence: true,  numericality: {only_integer: true, less_than: 20}
  validates :cell, presence: true, length: { minimum: 10, maximum: 20}
  validates :in_queue, presence: true
  validates :points_earned, presence: true
end
