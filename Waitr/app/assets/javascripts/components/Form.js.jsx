var Form = React.createClass({
  getInitialState: function(){
    return {value: ""}
  },
  handleChange: function(event){
    this.setState({value: event.target.value});
  },

  render: function(){

    return (
      <div>
        <input
          type="text"
          value={this.state.value}
          onChange={this.handleChange}
          placeholder="Enter Your Guess Here"
        />
        <button onClick={function(){saveGuess(
              this.props.party_id,
              this.props.question_id,
              this.props.round_id,
              this.state.value)}.bind(this)}>
              {"Save Guess"}
        </button>
      </div>
    )
  }
});

