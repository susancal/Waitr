var QuestionTimer = React.createClass({
  getInitialState: function(){
    return {timer: 15, waiting: "Answer Now!"}
  },
  componentDidMount: function(){
    this.startTimer();
  },
  componentWillUnmount: function(){
    clearInterval(this.interval);
  },
// called anytime the props or state updates
  componentDidUpdate: function(){
    if (this.props.complete === true){
      clearInterval(this.interval);
    }
  },

  checkZeroInterval: function(){
    if (this.state.timer <=0) {
      $('button').addClass('btn disabled')
      clearInterval(this.interval);
      this.setState({waiting: "Get Ready For Next Question" });
      setTimeout(this.questionReset, 10000);
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
