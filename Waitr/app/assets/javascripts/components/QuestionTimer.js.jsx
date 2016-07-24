var QuestionTimer = React.createClass({
  getInitialState: function(){
    return {timer: 3, waiting: ""}
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
      clearInterval(this.interval);
      this.setState({waiting: "Get Ready..." });
      setTimeout(this.questionReset, 1000);
    }
  },

  questionReset: function(){
    this.props.nextQuestion();
    this.setState({timer: 3});
    this.startTimer();
    this.setState({waiting: "" });
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
        <h1>{ this.state.timer}</h1>
        <p className="waiting"> {this.state.waiting} </p>
      </div>
      )
  }
})
