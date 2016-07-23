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

  stopInterval: function(){
    if (this.state.timer <= 0) {
      clearInterval(this.interval);
    }
    clearInterval(interval);
  },

  startTimer: function() {
    var interval = setInterval(function(){
       console.log("RUNNING")
      if (this.state.timer <= 0) {
        console.log("------")
        console.log(this.props.nextquestion);
        return;
      }
      this.decreaseTimer()
    }.bind(this), 1000)
  },

  decreaseTimer: function(){
    this.setState({timer: this.state.timer - 1})
  },
  render: function(){
    console.log(this.state.timer)
    this.stopInterval();
    return (
        <h1>{ this.state.timer + " seconds left"}</h1>
      )
  }
})
