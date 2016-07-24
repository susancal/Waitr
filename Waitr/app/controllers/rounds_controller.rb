class RoundsController < ApplicationController


  def index

  end

  def new

  end

  def show
    @quiz = Quiz.find(params[:quiz_id])
    @round = Round.find(params[:id])
    @quiz_questions = @quiz.questions
    @party_id = 1
  end

  def create
    @player1 = Party.find(session[:party_id])
    @round = Round.create!(party_one_id: params[:player_one_id])
    if @round
      p "SHITTTTTTT"
    end
    render :waiting
  end


  def waitingroom
   @player1 = Party.find(session[:party_id])
   @round = Round.new(party_id: @player1.id)
   p "!!!!!!!!!!!!"
   p @round
     # Check for any open rounds! if party_two_id is nil and no questions answered
     if Round.first_waiting_round
       @round = Round.find(Round.first_waiting_round)
       @round.party_two_id = session[:party_id]
       if @round.save
          p "111111111111111"
        else
          p "shiiiit"
      end
    else
     @player1 = Party.find(session[:party_id])
     @qid = @player1.quizzes_not_played.shift
     @round = Round.create(party_id: @player1.id, quiz_id: @qid)
     p "2222222222222222222222222"
   end
   render :waiting
 end


 def summary
 end


end
