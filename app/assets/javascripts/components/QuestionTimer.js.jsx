var QuestionTimer = React.createClass({
  getInitialState: function(){
    return {timer: 15, waiting: "Answer Now!"}
  },

  setUpSubscription: function(that){
     App.gameplay = App.cable.subscriptions.create("GameplayChannel", {

      connected: function(){
          $('body').append("WE ARE CONNECTED")
          $.get("/readytoplay", {key_number: that.props.keynum});
      },

      disconnected: function(){
          return;
      },

      received: function(data){
        console.log(data)
        if (data.status === "begin game") {
          that.startTimer();
        }

        if (data.guess.status != null && data.guess.status === "correct") {
          console.log("WORKING - CORRECT")
            if (data.guess.party_id === that.props.roundOther.party_id){
              that.props.setOtherScore(data.other_score);
            } else {
              that.props.setYourScore(data.your_score);
            }
        } else if (data.guess.status != null && data.guess.status === "incorrect") {
          console.log("WORKING - INCORRECT")
        }
      }
   })
  },

  componentDidMount: function(){
    this.setUpSubscription(this);
  },

  componentWillUnmount: function(){
    clearInterval(this.interval);
  },

  componentDidUpdate: function(){
    if (this.props.complete === true){
      clearInterval(this.interval);
      this.setState({waiting: "  "})
      this.props.goToSummary();
    }
  },

  checkZeroInterval: function(){
    if (this.state.timer <=0) {
      $('button').addClass('btn disabled')
      clearInterval(this.interval);
      this.setState({waiting: "Get Ready For Next Question" });
      setTimeout(this.questionReset, 5000);
    }
  },

  questionReset: function(){
    this.props.nextQuestion();
    this.setState({timer: 15});
    this.startTimer();
    this.setState({waiting: "Answer Now!" });
  },

  startTimer: function() {
     this.interval = setInterval(function(){
        this.decreaseTimer();
        this.checkZeroInterval();
    }.bind(this), 1000)
  },

  decreaseTimer: function(){
    this.setState({timer: this.state.timer - 1})
  },

  render: function(){
    return (
      <div>
        <h1 className="timer">{this.state.timer}'</h1>
        <p className="waiting"> {this.state.waiting} </p>
      </div>
      )
  }
})
