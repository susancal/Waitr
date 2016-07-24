var Form = React.createClass({
  getInitialState: function(){
    return {value: ""}
  },
  handleChange: function(event){
    this.setState({value: event.target.value});
  },
  saveGuess: function(party_id, question_id, round_id, guess_value){
    var guess = {party_id: party_id , question_id: question_id, round_id: round_id, guess_value: guess_value}

    $.post('/guesses', {guess: guess}).done(function(response){
    if (response.status === "correct") {
      this.props.incrementPlayerOneScore(1);
    } else if (response.status === "incorrect") {
      this.props.incrementPlayerOneScore(5);
    }
  }.bind(this));
 },

  render: function(){
    console.log(this.props)
    return (
      <div>
        <input
        type = "text"
        value = {this.state.value}
        onChange = {this.handleChange}
        placeholder = "Enter Your Guess Here"
        />

        <button className="btn waves-effect waves-light" onClick={
          function(){
            this.saveGuess(
              this.props.party_id,
              this.props.question_id,
              this.props.round_id,
              this.state.value, this.props.incrementPlayerOneScore
              )
          }.bind(this)
        }>
        {"Save Guess"}
        </button>
      </div>
      )
  }
});

