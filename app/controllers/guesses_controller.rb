class GuessesController < ApplicationController
  def create
    @question = Question.find(params[:question_id])
    @your_round = Round.find_by_secret_key_and_party_id(params[:key_number], current_party.id)
    @guess = Guess.new(party_id: current_party.id, question_id: @question.id, round_id: @your_round.id, guess_value: params[:guess_value])

    @your_round.player_num == 1 ? other_num = 2 : other_num = 1
    @other_round = Round.find_by_secret_key_and_player_num(params[:key_number], other_num)
    @other_round_score = @other_round.party_score

        if @guess.guess_value == @question.answer
          @guess.status = "correct"
          @guess.save
          @your_round.party_score = @your_round.party_score + 1
          @your_round.save
          @your_new_score = @your_round.party_score
          ActionCable.server.broadcast "gameplay", your_score: @your_new_score, other_score: @other_round_score, guess: @guess
        else
          @guess.status = "incorrect"
          @guess.save
          ActionCable.server.broadcast "gameplay", guess: @guess
        end

      # render json: {status: "incorrect"}
      #   else
      #     @guess.status = "incorrect"
      #     @your_new_score = @your_round.party_score
      #   end
      #   @guess.save
      # else
      #   render json: {status: "error"}
      # end
      # render json: {status: @guess.status, your_new_score: @your_new_score, other_new_score: @other_round_score}
    end

private
def data_params
  params.require(:data).permit(:question_id, :guess_value, :key_number)
end

  end
