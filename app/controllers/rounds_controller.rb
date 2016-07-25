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
    @key = Key.where(key: params[:key].to_s)[0]
    @quiz = @key.quiz
    @round = Round.create(secret_key: params[:key], party_id: session[:party_id], quiz_id: @quiz.id)
    @quiz_questions = @quiz.questions
    @party_id = session[:party_id]
    # Waitingroom.destroy_all
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



 def summary
 end


end
