function saveGuess (party_id, question_id, round_id, guess_value){
  var guess = {party_id: party_id , question_id: question_id, round_id: round_id, guess_value: guess_value}
  $.post('/guesses', {guess: guess}).done(function(response){
    console.log(response);
  });

}
