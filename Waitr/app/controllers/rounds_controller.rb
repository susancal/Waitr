class RoundsController < ApplicationController


  def index

  end

  def new

  end

  def create
    @player1 = Party.find(params[:player_one_id])
    @round = Round.create!(party_one_id: params[:player_one_id])
    if @round
      p "SHITTTTTTT"
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
