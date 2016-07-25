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
   session[:party_id] = 1 #HARDCODED
    if current_patron
      @round_you = Round.find_by_secret_key_and_party_id(params[:key], current_patron.id)
      @round_you.player_num = 1 ? other_num = 2 : other_num = 1
      @round_other = Round.find_by_secret_key_and_player_num(@round_you.secret_key, other_num)
      @quiz = Quiz.find(@round_you.quiz_id)
        @quiz_questions = @quiz.questions
    else
      not_found
    end
  end

# POTENTIAL DELETE
  # def create
  #   @player1 = Party.find(session[:party_id])
  #   # @player = Party.find(session[:party_id])
  #   @round = Round.create!(party_one_id: params[:player_one_id])
  #   # @round = Round.create!(party_id: params[:player_id])
  #   if @round
  #     p "SHITTTTTTT"
  #   end
  #   render :waiting
  # end

 def summary
    Waitingroom.destroy_all
 end


end
