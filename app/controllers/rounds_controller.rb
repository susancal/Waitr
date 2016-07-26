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
    sleep(2)
    Waitingroom.destroy_all
  end

  def create
    #FIND TWO PEOPLE


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
