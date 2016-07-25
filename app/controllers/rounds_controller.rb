class RoundsController < ApplicationController

  def index

  end

  def new

  end

  def update
    @round = Round.find(params[:id].to_i)
    @round.party_score = params[:party_score].to_i
    p @round
    p "IM HEERRRREEEEEEsubl "
    if @round.save
       @status = "SAVED"
       render json: {status: @status}
    else
      @status = " NOT SAVED"
       render json: {status: @status}
    end
  end

  def show
    # @round = Round.where(secret_key: params[:key].to_i, party_id: session[:party_id])[0]rai
    @round = Round.first
    @quiz = Quiz.find(@round.quiz_id)
    @quiz_questions = @quiz.questions
    @round_you = Round.find(1)  #HARDCODED
    @round_other = Round.find(2) #HARDCODED
  end

  def create
    @player1 = Party.find(session[:party_id])
    # @player = Party.find(session[:party_id])
    @round = Round.create!(party_one_id: params[:player_one_id])
    # @round = Round.create!(party_id: params[:player_id])
    if @round
      p "SHITTTTTTT"
    end
    render :waiting
  end


  def waitingroom
   @player1 = Party.find(session[:party_id])
   @round = Round.new(party_id: @player1.id)
   # wait for the server to make another round with the same key as the curent round.
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
    Waitingroom.destroy_all
 end


end
