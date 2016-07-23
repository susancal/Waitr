class GuessesController < ApplicationController
  def create
    p " KJAHFK JAHDSJK AHSJKHASJK ADJKSHASHD AS"
    p params[:round_id]
    @round = Round.find(params[:guess][:round_id])
    @question = Question.find(params[:guess][:question_id])
    @quiz = Quiz.find(@question.quiz.id)
    @next_question = @quiz.select_question

    @guess = Guess.new(guess_params)
    if @guess.save
      redirect_to quiz_round_question_path(@quiz, @round, @next_question)
    else
      p "SHIT"
    end
  end



  private

  def guess_params
    params.require(:guess).permit(:question_id, :round_id, :guess_value, :party_id)
  end

end
