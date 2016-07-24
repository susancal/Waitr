class Restaurant < ApplicationRecord
  has_secure_password

  has_many :parties
  has_one :prize

  validates :name, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true
  validates :password_digest, presence: true



  def waiting_list
    waiting_parties = []
    active_parties = self.parties.where(in_queue: true).order(:created_at)
    active_parties.each { |party| waiting_parties << party }
    return waiting_parties
  end

end
