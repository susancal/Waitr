var QuestionTimer = React.createClass({
  getInitialState: function(){
    return {timer: 5};
  },
  componentDidMount: function(){
    this.startTimer();
  },
  componentWillUnmount: function(){
    clearInterval(interval);
  },

  startTimer: function() {
    var interval = setInterval(function(){
       console.log("RUNNING")
      if (this.state.timer <= 0) {
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
    return (
        <h1>{ this.state.timer + " seconds left"}</h1>
      )
  }
})
