var QuestionTimer = React.createClass({
  getInitialState: function(){
    return {timer: 15};
  },
  componentDidMount: function(){
    this.startTimer();
  },

  startTimer: function() {
    setInterval(function(){
      if (this.state.timer === 0) {
        $.get()
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
