class RoundsController < ApplicationController


  def index

  end

  def new

  end

  def create
    # Check for any open rounds! if party_two_id is nil
    if Round.first_waiting_round
      @round = Round.find(Round.first_waiting_round)
      @round.party_two_id = params[:player_id]
      @round.save
    else
      @player1 = Party.find(params[:player_id])
      @qid = @player1.quizzes_not_played.shift
      @round = Round.create(party_id: params[:player_one_id], quiz_id: @qid)
    end
      render :waiting
  end

  def show
    @quiz = Quiz.find(params[:quiz_id])
    @round = Round.find(params[:id])
    @quiz_questions = @quiz.questions
    @party_id = 1
  end


  def summary
  end


end
