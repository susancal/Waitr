var Form = React.createClass({
  getInitialState: function(){
    return {value: "", guess: "", guess_response: ""}
  },

  componentWillReceiveProps: function(nextProps){
    if (nextProps.question_id !== this.props.question_id) {
      this.setState({value: ""});
      this.setState({guess: ""});
      this.setState({guess_response: ""});
    }
  },

  handleChange: function(event){
    this.setState({value: event.target.value});
  },
  saveGuess: function(party_id, question_id, round_id, guess_value){
    var guess = {party_id: party_id , question_id: question_id, round_id: round_id, guess_value: guess_value}
      this.setState({guess: guess.guess_value})
    $.post('/guesses', {guess: guess}).done(function(response){
          this.props.updateAnswer();
          console.log(response.status)
        if (response.status === "correct") {
            this.props.incrementPlayerScore();
            this.setState({guess_response: 'CORRECT!'})
            $('h3#guess-status').removeClass("guess-status-incorrect")
            $('h3#guess').addClass('guess-status-correct')

        } else {
            this.setState({guess_response: 'INCORRECT'})
            $('h3#guess-status').removeClass("guess-status-correct")
            $('h3#guess').addClass('guess-status-incorrect')
        }
    }.bind(this));
 },

  render: function(){
    return (
      <div className="guess-container">
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
              this.state.value, this.props.incrementPlayerScore
              )
          }.bind(this)
        }>
        {"Save Guess"}
        </button>
        <h3 id="guess"> {this.state.guess} {this.state.guess_response}</h3>
      </div>
      )
  }
});
