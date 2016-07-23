class GuessesController < ApplicationController
  def create
    binding.pry



    # @round = Round.find(params[:guess][:round_id])
    # @question = Question.find(params[:guess][:question_id])
    # @quiz = Quiz.find(@question.quiz.id)
    # @next_question = @quiz.select_question

    @guess = Guess.new(guess_params)
    p @guess
    if @guess.save
      render json: {message: "Your guess has saved."}.to_json
    else
      p "SHIT"
    end
  end



  private

  def guess_params
    params.require(:guess).permit(:question_id, :round_id, :guess_value, :party_id)
  end

end
