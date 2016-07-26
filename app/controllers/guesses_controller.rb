class GuessesController < ApplicationController
  def create
    @guess = Guess.new(guess_params)
    @question = Question.find(@guess.question_id)
    @your_round = Round.find(params[:guess][:round_id])
    p @your_round
    @your_round.player_num = 1 ? other_num = 2 : other_num = 1
      @other_round = Round.find_by_secret_key_and_player_num(@your_round.secret_key, other_num)
      @other_round_score = @other_round.party_score
      if @guess.save
        if @guess.guess_value == @question.answer
          @guess.status = "correct"
          @your_round.party_score +=1
          @your_round.save
          @your_new_score = @your_round.party_score
        else
          @guess.status = "incorrect"
          @your_new_score = @your_round.party_score
        end
        @guess.save
      else
        render json: {status: "error"}
      end
      render json: {status: @guess.status, your_new_score: @your_new_score, other_new_score: @other_round_score}
    end

    private

    def guess_params
      params.require(:guess).permit(:question_id, :round_id, :guess_value, :party_id)
    end

  end
