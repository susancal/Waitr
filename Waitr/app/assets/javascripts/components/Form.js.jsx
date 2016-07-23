var guess = {party_id: 2, question_id: 8, round_id: 1, guess_value: "1996"}

var Form = React.createClass({
  render: function(){
    return (
      <button onClick={function(){
          saveGuess(guess);
        }
      }> {"Save Guess"} </button>
    )
  }
});

