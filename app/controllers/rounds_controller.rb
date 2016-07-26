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
      @wr = Waitingroom.find_by(party_id: @party_id)
      @any_rounds = Round.where(secret_key: @key.key)
      if @any_rounds.length < 1
        @round_you = Round.create(secret_key: params[:key], party_id: @party_id, quiz_id: @quiz.id, player_num: 2)
      else
        @round_you = Round.create(secret_key: params[:key], party_id: @party_id, quiz_id: @quiz.id, player_num: 1)
      end
      if Round.where(secret_key: @key_number).length == 2
        Waitingroom.destroy_all
      end
      @round_you.player_num = 1 ? other_num = 2 : other_num = 1
      @round_other = Round.find_by_secret_key_and_player_num(@key.key, other_num)
    else
      not_found
    end
  end


 def summary
  @party = current_patron
  @restaurant = Restaurant.find(@party.restaurant_id)
  @your_round = Round.find_by_secret_key_and_party_id(params[:key], current_patron.id)
  @your_round.player_num == 1 ? other_num = 2 : other_num = 1
  @other_round = Round.find_by_secret_key_and_player_num(params[:key], other_num)
  @your_round_score = @your_round.party_score
  @other_round_score = @other_round.party_score
  @quiz_length = Quiz.find(id: @your_round.quiz_id).questions.length
    if @your_round_score > @other_round_score
      @message = "You won 1,000 pts!"
      @party.points_earned += 1000
      @party.save
    elsif @other_round_score > @your_round_score
      @message = "Opponent won"
    else
      @message = "Tie Game"
    end
  end


end
