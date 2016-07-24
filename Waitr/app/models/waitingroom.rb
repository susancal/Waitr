class Waitingroom < ApplicationRecord
  belongs_to :restaurant
  belongs_to :party
end
