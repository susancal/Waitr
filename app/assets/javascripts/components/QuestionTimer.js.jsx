var QuestionTimer = React.createClass({
  getInitialState: function(){
    return {timer: 15, text_status: "Answer Now!", guess_one_update: "", guess_two_update: ""}
  },

  setUpSubscription: function(that){
     App.gameplay = App.cable.subscriptions.create("GameplayChannel", {

      connected: function(){
          $.get("/readytoplay", {key_number: that.props.keynum});
      },

      disconnected: function(){
          return;
      },

      received: function(data){
        console.log(data)

      // Start Game in sync
        if (typeof data.status!== 'undefined') {
          if (data.status === "begin game") {
            that.startTimer();
            return;
          } else if (data.status === "waiting for other player") {
            return;
          }
        }

      // Append updates from players guesses
        if (typeof data.guess.status!== 'undefined') {
          if ( $("p.update1").length > 0 ) {
                $("p.update1").append("<p class='update'> The " + data.current_party.name + " party's guess was " + data.guess.status + " </p>")
          } else {
               $("p.waiting").append("<p class='update'> The " + data.current_party.name + " party's guess was " + data.guess.status + " </p>")
          }

      // Update scores based on each other's updates
              if (data.guess.status === "correct") {
                  if (data.guess.party_id === that.props.currentParty.id) {
                    that.props.setYourScore(data.your_round.party_score);
                  } else {
                    that.props.setOtherScore(data.your_round.party_score);
                  };
              }
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
      this.setState({text_status: "  "})
      this.props.goToSummary();
    }
  },

  checkZeroInterval: function(){
    if (this.state.timer <=0) {
      $('button').addClass('btn disabled')
      clearInterval(this.interval);
      $('p.update').remove();
      this.setState({text_status: "Correct answer was: " + this.props.question.answer + ". Get Ready For Next Question" });
      setTimeout(this.questionReset, 5000);
    }
  },

  questionReset: function(){
    this.props.nextQuestion();
    this.setState({timer: 15});
    this.startTimer();
    this.setState({text_status: "Clock's Tickin'" });
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
        <h1 className="timer">{this.state.timer}</h1>
        <p className="waiting"> {this.state.text_status} </p>
      </div>
      )
  }
})
