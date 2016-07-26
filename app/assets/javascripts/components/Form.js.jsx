var Form = React.createClass({
  getInitialState: function(){
    return {value: "", guess: "", guess_response: "", button_clicked_count: 0}
  },

  componentWillReceiveProps: function(nextProps){
    if (nextProps.question_id !== this.props.question_id) {
      this.setState({value: ""});
      this.setState({guess: ""});
      this.setState({guess_response: ""})
      this.setState({button_clicked_count: 0})
    }
  },

  handleChange: function(event){
    this.setState({value: event.target.value});
  },

  saveGuess: function(question_id, guess_value, key_number){
      var data = {question_id: question_id, guess_value: guess_value, key_number: key_number}
      var guess = guess_value
    this.setState({button_clicked_count: this.state.button_clicked_count + 1})

    if (this.state.button_clicked_count < 1) {
      $.post('/guesses', data).done(function(response){
          this.props.updateAnswer();
          console.log(response)
          this.props.setYourScore(response.your_new_score)
          this.props.setOtherScore(response.other_new_score)
    if (response.status === "correct") {
          this.setState({guess: "'" + guess + "'" + " was "})
          this.setState({guess_response: "CORRECT!"});
          $('h3#guess').removeClass("guess-status-incorrect")
          $('h3#guess').addClass('guess-status-correct')
        } else {
          this.setState({guess: "'" + guess + "'" + " was "})
          this.setState({guess_response: 'INCORRECT'})
          $('h3#guess').removeClass("guess-status-correct")
          $('h3#guess').addClass('guess-status-incorrect')
        }
    }.bind(this));
  } else {
    this.setState({value: ""})
  }
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
              this.props.question_id,
              this.state.value,
              this.props.key_number
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

