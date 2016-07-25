var ScoreBoard = React.createClass({
  render: function(){
    return (
      <div className="scoreboard-container">
        <h3 className="score-board"># Correct: {this.props.playerScore}</h3>
      </div>
    )
  }
})
