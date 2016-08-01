var Form = React.createClass({
  getInitialState: function(){
    return {value: "", button_clicked_count: 0}
  },

  componentWillReceiveProps: function(nextProps){
    if (nextProps.question_id !== this.props.question_id) {
      this.setState({value: ""});
      this.setState({button_clicked_count: 0})
    }
  },

  handleChange: function(event){
    this.setState({value: event.target.value});
  },

  saveGuess: function(that, question_id, guess_value, key_number){
    var data = {question_id: question_id, guess_value: guess_value, key_number: key_number}
    var guess = guess_value
    that.setState({button_clicked_count: that.state.button_clicked_count + 1})

    if (that.state.button_clicked_count < 1) {
        $.post('/guesses', data).done(function(response){
          that.setState({value: ""})
          $('button').addClass('btn disabled')
        })
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
            this.saveGuess(this,
              this.props.question_id,
              this.state.value,
              this.props.key_number
              )
          }.bind(this)
        }>
        {"Save Guess"}
        </button>
      </div>
      )
  }
});

