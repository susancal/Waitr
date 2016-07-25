var ScoreBoard = React.createClass({
  renderPlayerTitle: function(player){
      return (
          <div className="player">
            <h4> {player} </h4>
          </div>
        )
  },

  renderPlayerScore: function(score){
    return (
        <div className="score-box">
            {score}
        </div>
      )
  },

  renderSingleBoard: function(player, score){
     return (
        <div className="score-board">
            {this.renderPlayerTitle(player)}
            {this.renderPlayerScore(score)}
        </div>
      )

  },

  render: function(){
    return (
      <div className="score-board-container">
        {this.renderSingleBoard("You",this.props.yourScore)}
        {this.renderSingleBoard("Opponent",this.props.otherScore)}
      </div>
    )
  }
})
