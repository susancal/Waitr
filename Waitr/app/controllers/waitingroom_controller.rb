class WaitingroomController < ApplicationController

  def new
  end

  def index

  end

  def check
    if request.xhr?
      render json: Waitingroom.all.length.to_json
    end
  end

  def match
    players = Waitingroom.first(2)
    rnd_key = match_key
    random_q = rand(1..30)
    Round.create(quiz_id: random_q, secret_key: rnd_key, party_id: players[0].id, player_num: 1)
    Round.create(quiz_id: random_q, secret_key: rnd_key, party_id: players[1].id, player_num: 2)
    # players[0].destroy
    # players[1].destroy
    render :match
  end

  def match_key
    return [*"0".."9"].sample(6).join
  end

  def find_game

  end

end
