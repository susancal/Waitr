class GuessesController < ApplicationController
  def create
    # binding.pry
    @guess = Guess.new(guess_params)
    @question = Question.find(@guess.question_id)
    p @guess

    if @guess.save
      if @guess.guess_value == @question.answer
          @status = "correct"
      else
          @status = "incorrect"
      end
    else
      @status = "notsave"
    end

      render json: {status: @status}
  end


  private

  def guess_params
    params.require(:guess).permit(:question_id, :round_id, :guess_value, :party_id)
  end

end
