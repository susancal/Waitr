class Restaurant < ApplicationRecord
  has_secure_password

  has_many :parties
  has_one :prize

  validates :name, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true
  validates :password_digest, presence: true

  def 

  def waiting_list
    waiting_list = []
    active_parties = self.parties.where(in_queue: true)
    active_parties.each { |parties| waiting_list << parties }
    return waiting_list
  end

end
