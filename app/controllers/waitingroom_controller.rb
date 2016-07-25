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
    players = Waitingroom.first(2).map { |e| e.party_id }
    rnd_key = match_key
    random_q = rand(1..30)
    p "are we here??????????????????????????????????????"
    Round.create(quiz_id: random_q, secret_key: rnd_key, party_id: players[0], player_num: 1)
    Round.create(quiz_id: random_q, secret_key: rnd_key, party_id: players[1], player_num: 2)
    redirect_to "/rounds/key/#{rnd_key}"
  end

  def match_key
    return [*"0".."9"].sample(6).join
  end

  def find_game
  end

  def sendstatus
    round1 = Round.create(quiz_id: random_q, secret_key: rnd_key, party_id: players[0], player_num: 1)
    round2 = Round.create(quiz_id: random_q, secret_key: rnd_key, party_id: players[1], player_num: 2)

    if round1.save && round2.save
      ActionCable.server.broadcast 'waitingroom',
        message: "THERE WAS A MATCH OR SOMETHING ZOMG"
      head :ok
    end
  end

end
