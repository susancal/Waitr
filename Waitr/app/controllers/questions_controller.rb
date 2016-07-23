class QuestionsController < ApplicationController
  def show
    @quiz = Quiz.find(params[:quiz_id])
    p @quiz
    @round = Round.find(params[:round_id])
    p "ROUNDNDDDDDDJHAGSDJHSGDJH"
    p @round
    @question = @quiz.select_question
    p @question
    @guess = Guess.new(round_id: @round.id, question_id: @question.id)
  end
end
