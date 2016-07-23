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
    self.restaurant.waiting_list.index(self)
  end

  def queue_position
    queue_index + 1
  end

  def self.waiting_parties_count
    parties = []
    self.all.each do |party|
      if party.in_queue
        parties << party
      end
    end
    return parties.length
  end

  def clean_number
    number = self.number.scan(/\d+/).join
    number[0] == "1" ? number[0] = '' : number
    number unless number.length != 10
  end

end
