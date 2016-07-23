class Restaurant < ApplicationRecord
  has_many :parties
  has_many :prizes

  validates :name, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true
  validates :password_digest, presence: true

  def waiting_list
    self.parties.where(in_queue: true)
  end

end
