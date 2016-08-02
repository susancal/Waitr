require 'date'

class Party < ApplicationRecord
  has_many :guesses
  has_many :rounds
  has_many :quizzes_taken, through: :rounds, source: :quiz
  belongs_to :restaurant
  has_one :waitingroom

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

  def clean_number
    number = self.number.scan(/\d+/).join
    number[0] == "1" ? number[0] = '' : number
    number unless number.length != 10
  end

  def elapsed
    t = (Time.now - self.created_at)
    return Time.at(t).utc.strftime("%H:%M:%S")
  end

  before_create do
    self.key = [*"0".."9"].sample(6).join
  end

  def did_they_win?
    # restaurant = Restaurant.find(self.restaurant.id)
    if restaurant.prize != nil
      return true if self.points_earned >= restaurant.prize.points_needed
    end
  end

  def quizzes_not_played
     taken = self.quizzes_taken.map { |q| q.id }
     all = Quiz.all.map { |e| e.id }
     avail = all - taken
     return avail
  end

  # def send_prize_email
  #     restaurant = Restaurant.find(self.restaurant.id)
  #     account_sid = ENV['TWILIO_SID']
  #     auth_token = ENV['TWILIO_TOKEN']
  #     phone_numbers = []

  #     @client = Twilio::REST::Client.new account_sid, auth_token

  #     phone_numbers.each do |phone|

  #       @client.messages.create(
  #         from: '',
  #         # to: '',
  #         to: phone,
  #         body: "You WON!!!! Claim your prize of #{restaurant.prize.prize_name}.")
  #     end
  # end


end