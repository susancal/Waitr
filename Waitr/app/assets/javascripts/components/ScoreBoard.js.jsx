var ScoreBoard = React.createClass({
  getInitialState: function() {
      return {current_score: 0};
  },

  render: function(){
    return (
      <div>
        <h1>Group 1 Score</h1>
        <h1> {this.state.current_score} </h1>
      </div>
    )
  }
})
