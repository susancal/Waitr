class Prize < ApplicationRecord
  belongs_to :restaurant

  validates :restaurant_id, presence: true
  validates :points_needed, presence: true
  validates :prize_name, presence: true

end
