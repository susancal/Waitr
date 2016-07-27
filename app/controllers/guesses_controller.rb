class GuessesController < ApplicationController
  def create
    @question = Question.find(params[:question_id])
    @your_round = Round.find_by_secret_key_and_party_id(params[:key_number], current_party.id)
    @guess = Guess.new(party_id: current_party.id, question_id: @question.id, round_id: @your_round.id, guess_value: params[:guess_value])
# Find Other Round
    @your_round.player_num == 1 ? other_num = 2 : other_num = 1
    @other_round = Round.find_by_secret_key_and_player_num(params[:key_number], other_num)
    @other_round_score = @other_round.party_score
# Correctness check
        if @guess.guess_value == @question.answer
          @guess.update_attributes status: "correct"
          @your_round.update_attributes party_score: @your_round.party_score + 1
        else
          @guess.update_attributes status: "incorrect"
        end
 # Broadcast your round, other round, and guess objects to gameplay channel
    ActionCable.server.broadcast "gameplay", your_round: @your_round, other_round: @other_round, guess: @guess, current_party: current_party
    end

private
def data_params
  params.require(:data).permit(:question_id, :guess_value, :key_number)
end

  end
