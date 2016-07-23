var QuestionTimer = React.createClass({
  getInitialState: function(){
    return {timer: 5};
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
      this.props.nextQuestion();
      this.setState({timer: 5});
      this.startTimer();
    }
  },
  startTimer: function() {
     this.interval = setInterval(function(){
        console.log("RUNNNING")
        this.decreaseTimer();
        this.checkZeroInterval();
    }.bind(this), 1000)
  },

  decreaseTimer: function(){
    this.setState({timer: this.state.timer - 1})
  },

  render: function(){
    console.log(this.props.complete)
    return (
        <h1>{ this.state.timer + " seconds left"}</h1>
      )
  }
})
