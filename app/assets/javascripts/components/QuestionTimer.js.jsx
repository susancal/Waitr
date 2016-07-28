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
        this.setState({text_status: "Correct answer was: " + "'" + this.props.question.answer + "'"})
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

  loadGraphObject: function(){

    var data = [ {name: "one second", value: 1} ];
    var margin = {top: 10, right: 0, bottom: 0, left: 0};
        width = 105 - margin.left - margin.right;
        height = width - margin.top - margin.bottom + 10;

    var svg = d3.select("#chart")
        .append('svg')
          .attr("width", width + margin.left + margin.right)
          .attr("height", height + margin.top + margin.bottom)
         .append("g")
          .attr("transform", "translate(" + ((width/2)+margin.left) + "," + ((height/2)+margin.top) + ")");

    var radius = Math.min(width, height) / 2;
    var colors = ["#42A5F5",  "#99d6ff"]
    var color = d3.scale.linear().range(colors);
    var arc = d3.svg.arc()
        .outerRadius(radius - 10)
        .innerRadius(radius - 18);
    var pie = d3.layout.pie()
        .sort(null)
        .startAngle(0)
        .endAngle(2*(Math.PI))
        .value(function(d) { return d.value; });
    var g = svg.selectAll(".arc")
      .data(pie(data))
    .enter().append("g")
      .attr("class", "arc");

    g.append("path")
      .style("fill", color(0))
      .transition().delay(function(d, i) { return i * 1; }).duration(30000)
      .attrTween('d', function(d) {
           var i = d3.interpolate(d.startAngle+0.1, d.endAngle);
           return function(t) {
               d.endAngle = i(t);
             return arc(d);
           }
      });
  },

  startTimer: function() {
    $("#chart").empty();
     this.loadGraphObject();
     this.interval = setInterval(function(){
        this.decreaseTimer();
        this.checkZeroInterval();
    }.bind(this), 1000)
  },

  decreaseTimer: function(){
    this.setState({timer: this.state.timer - 1})
    this.appendTimer(this.state.timer);
  },

  appendTimer: function (timer) {
    var timer = String(this.state.timer);
    console.log(timer);
    d3.selectAll("text").remove()
    d3.selectAll(".arc")
      .append("text")
        .classed("timer-text", true)
        .text(timer).attr("text-anchor", "middle").attr('font-family', 'sans-serif').attr('dy', '13');
  },

  render: function(){
    return (
      <div id="timer">
        <p className="update"> {this.state.text_status} </p>
        <div id="chart"> </div>
        <p className="waiting"> {this.state.waiting} </p>
      </div>
      )
  }
})
