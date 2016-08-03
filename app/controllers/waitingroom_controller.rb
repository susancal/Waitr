class WaitingroomController < ApplicationController

  def new
  end

  def index
  end

  def check
    if request.xhr?
      if Waitingroom.all.length == 1
        render json: Waitingroom.all.length.to_json
      elsif Waitingroom.all.length == 2
        players = Waitingroom.first(2).map { |e| e.party_id }
        rnd_key = match_key
        random_q = 1
        Round.create(quiz_id: random_q, secret_key: rnd_key, party_id: players[0], player_num: 1)
        Round.create(quiz_id: random_q, secret_key: rnd_key, party_id: players[1], player_num: 2)
        render json: Waitingroom.all.length.to_json
      end
    end
  end

  def match
    players = Waitingroom.first(2).map { |e| e.party_id }
    rnd_key = match_key
    random_q = rand(1..30)
    Round.create(quiz_id: random_q, secret_key: rnd_key, party_id: players[0], player_num: 1)
    Round.create(quiz_id: random_q, secret_key: rnd_key, party_id: players[1], player_num: 2)
    redirect_to "/rounds/key/#{rnd_key}"
  end

  def match_key
    return [*"0".."9"].sample(6).join
  end

  def clearwaitingrooms
    Waitingroom.destroy_all
  end

end
