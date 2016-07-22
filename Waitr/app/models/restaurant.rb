class Restaurant < ApplicationRecord
  has_many :parties
  has_many :prizes

  validates :name, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true
  validates :password_digest, presence: true

end
