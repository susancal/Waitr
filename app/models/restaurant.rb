class Restaurant < ApplicationRecord
  has_secure_password

  has_many :parties
  has_one :prize
  has_many :waitingrooms
  has_many :waiting_parties, through: :waitingrooms, source: :party

  validates :name, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true
  validates :password_digest, presence: true



  def waiting_list
    active_parties = self.parties.where(in_queue: true)
    active_parties.sort{|a,b| b[:created_at] <=> a[:created_at]}
    return active_parties
  end



end
