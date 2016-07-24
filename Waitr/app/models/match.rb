class Match < ApplicationRecord
  def self.create(uuid)
    if REDIS.get("matches").blank?
      REDIS.set("matches", uuid)
    else
    # Get the uuid of the player waiting
      opponent = REDIS.get("matches")

      Game.start(uuid, opponent)
      # Clear the waiting key as no one new is waiting
      REDIS.set("matches", nil)
    end
  end
end
