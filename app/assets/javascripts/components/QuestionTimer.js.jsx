var QuestionTimer = React.createClass({
  getInitialState: function(){
    return {timer: 30, text_status: "Let the game's begin!"}
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
            $.get('/clearwaitingrooms').done(function(response){
              console.log("WAITING ROOMS CLEARED")
            });
            that.startTimer();
            return;
          } else if (data.status === "waiting for other player") {
            return;
          }
        }

      // Append updates from players guesses
        if (typeof data.guess.status!== 'undefined') {
              if ( $("p.update1").length > 0 && that.state.timer >=1) {
                    $("p.update1").append("<p class='update " + data.guess.status + "'>" + "The " + data.current_party.name + " party's guess was " + data.guess.status + " </p>")
              } else if (that.state.timer >=1) {
                    $("p.waiting").append("<p class='update " + data.guess.status + "'>" + "The " + data.current_party.name + " party's guess was " + data.guess.status + " </p>")
              }

      // Update scores based on each other's updates
              if (data.guess.status === "correct") {
                  if (data.guess.party_id === that.props.currentParty.id) {
                    that.props.setYourScore(data.your_round.party_score);
                  } else {
                    that.props.setOtherScore(data.your_round.party_score);
                  }
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
      this.props.goToSummary();
    }
  },

  checkZeroInterval: function(){
    if (this.state.timer <=0) {
      $('button').addClass('btn disabled')
      clearInterval(this.interval);
      $('p.update').remove();
        if (this.props.lastQuestion == true) {
          this.setState({text_status: "Correct answer was: " + this.props.question.answer + ". Let'see the results."})
        } else {
        this.setState({text_status: "Correct answer was: " + "'" + this.props.question.answer + "'"});
      }
      setTimeout(this.questionReset, 10000);
    }
  },

  checkLastQuestion: function(){
    if (this.props.last_question == true) {
      this.setState({text_status: "Last Question!" });
    } else {
      this.setState({text_status: "Submit Your Guess!" });
    }

  },

  questionReset: function(){
    this.props.nextQuestion();
    this.checkLastQuestion();
    this.setState({timer: 30});
    this.startTimer();
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
