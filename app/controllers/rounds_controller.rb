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
 end

end
