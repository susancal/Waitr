class RoundsController < ApplicationController

  def update
    @round = Round.find(params[:id].to_i)
    @round.party_score = params[:party_score].to_i
    if @round.save
       @status = "SAVED"
       render json: {status: @status}
    else
      @status = "NOT SAVED"
       render json: {status: @status}
    end
  end

  def show
    @key = Key.where(key: params[:key].to_s)[0]
    @quiz = @key.quiz
    @round = Round.create(secret_key: params[:key], party_id: session[:party_id], quiz_id: @quiz.id)
    @quiz_questions = @quiz.questions
    @party_id = session[:party_id]
    sleep(2)
    Waitingroom.destroy_all
  end

  def create

    @player1 = Party.find(session[:party_id])
    # @player = Party.find(session[:party_id])
    @round = Round.create!(party_one_id: params[:player_one_id])
    # @round = Round.create!(party_id: params[:player_id])
    if @round
      p "SHITTTTTTT"
    if current_patron
      @key = Key.where(key: params[:key].to_s)[0]
      @key_number = @key.key
      @quiz = @key.quiz
      @quiz_questions = @quiz.questions
      @party_id = session[:party_id]
      @any_rounds = Round.where(secret_key: @key.key)

      if @any_rounds.length < 1
        @round_you = Round.create(secret_key: params[:key], party_id: @party_id, quiz_id: @quiz.id, player_num: 2)
      else
        @round_you = Round.create(secret_key: params[:key], party_id: @party_id, quiz_id: @quiz.id, player_num: 1)
      end

      @round_you.player_num = 1 ? other_num = 2 : other_num = 1
      @round_other = Round.find_by_secret_key_and_player_num(@key.key, other_num)
      sleep(8)
      Waitingroom.destroy_all
    else
      not_found
    end
  end

 def summary
  round = Round.where(secret_key: params[:key])
  @player_1 = round.find_by(party_id: 1)
  @player_2 = round.find_by(party_id: 2)
 end

 def data
  round = Round.where(secret_key: params[:key])
  @player_1_round = round.find_by(party_id: 1)
  p "$)HJEIUOFWEHFIUOPEWHJFIOWEPJFIOEWPFJIOPWEJFIWEOPFJIEWOPFJEWIOPFJOPEWIF"
  p @player_1_round.party_score
  p "$)HJEIUOFWEHFIUOPEWHJFIOWEPJFIOEWPFJIOPWEJFIWEOPFJIEWOPFJEWIOPFJOPEWIF"
  @player_2_round = round.find_by(party_id: 2)
  respond_to do |format|
    format.json {
      render json: [@player_1_round.party_score, @player_2_round.party_score]
    }
  end
 end

end
