class QuestionsController < ApplicationController
  def show
    @quiz = Quiz.find(params[:quiz_id])
    @round_id = params[:round_id]
    # @question = @quiz.select_question
    # @guess = Guess.new(round_id: @round.id, question_id: @question.id)
    @quiz_questions = @quiz.questions
    @party_id = 2
  end
end
