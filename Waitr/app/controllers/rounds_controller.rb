class RoundsController < ApplicationController


  def index

  end

  def new

  end

  def show
    @round = Round.where(secret_key: params[:key], party_id: session[:party_id])[0]
    p @round.quiz
    @quiz = Quiz.find(@round.quiz_id)
    @quiz_questions = @quiz.questions
    @party_id = session[:party_id]
  end

  def create
    @player1 = Party.find(session[:party_id])
    @round = Round.create!(party_one_id: params[:player_one_id])
    if @round
      p "SHITTTTTTT"
    end
    render :waiting
  end





 def summary
    Waitingroom.destroy_all
 end


end
