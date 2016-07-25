var ScoreBoard = React.createClass({
  render: function(){
    return (
      <div>
        <h3 className="score-board">Round Points: {this.props.playerScore}</h3>
      </div>
    )
  }
})
