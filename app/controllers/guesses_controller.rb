class GuessesController < ApplicationController
  def create
    @guess = Guess.new(guess_params)
    @question = Question.find(@guess.question_id)
    @round = Round.find(params[:guess][:round_id])

    if @guess.save
      if @guess.guess_value == @question.answer
          @guess.status = "correct"
          @round.party_score +=1
          @round.save
          @score = @round.party_score
      else
          @guess.status = "incorrect"
          @score = @round.party_score
      end
      @guess.save
    else
      render json: {status: "error"}
    end
      render json: {status: @guess.status, current_score: @score}
  end

  private

  def guess_params
    params.require(:guess).permit(:question_id, :round_id, :guess_value, :party_id)
  end

end
