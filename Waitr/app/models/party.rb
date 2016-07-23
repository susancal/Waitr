require 'date'

class Party < ApplicationRecord
  has_many :guesses
  has_many :rounds
  belongs_to :restaurant

  validates :restaurant_id, presence: true
  validates :name, presence: true
  validates :size, presence: true,  numericality: {only_integer: true, less_than: 20}
  validates :cell, presence: true, length: { minimum: 10, maximum: 20}
  validates :points_earned, presence: true

  def queue_index
    list = self.restaurant.waiting_list
    list.index(self)
  end

  def queue_position
    queue_index + 1
  end

  def formatted_cell
    ph = self.cell
    return "(#{ph[0,3]}) #{ph[3,3]}-#{ph[6,4]}"
  end


  def place_in_line
    @restaurant
  end

  def clean_number
    number = self.number.scan(/\d+/).join
    number[0] == "1" ? number[0] = '' : number
    number unless number.length != 10
  end

  def elapsed
    t = (Time.now - self.created_at)
    return Time.at(t).utc.strftime("%H:%M:%S")
  end

end
