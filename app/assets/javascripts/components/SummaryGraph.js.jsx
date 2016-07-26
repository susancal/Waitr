var SummaryGraph = React.createClass({

  renderGraph: function(player,score){

    var dataset = {
      scores: [score, 10 - score]
    };
     console.log(dataset)
    var average = (score/ this.props.quiz_length) * 100
    var append = "." + player
    var width = 300,
        height = 200,
        radius = Math.min(width, height) / 1.5,
        text = average + "%";

    var colors = ["#42A5F5",  "#99d6ff"]

    var color = d3.scale.linear().domain([0,1]).range(colors);

    var pie = d3.layout.pie()
        .sort(null);

    var arc = d3.svg.arc()
        .innerRadius(radius - 100)
        .outerRadius(radius - 50);

    var svg = d3.select(append).append("svg")
        .attr("width", width)
        .attr("height", height)
        .append("g")
        .attr("transform", "translate(" + width / 2 + "," + height / 2 + ")");

     svg.append("text").text(text).attr("text-anchor", "middle").attr();

    var path = svg.selectAll("path")
        .data(pie(dataset.scores))
      .enter().append("path")
        .attr("fill", function(d, i) { return color(i); })
        .attr("d", arc);

  },

  render: function(){
    return(
      <div class="graphs">
        {this.renderGraph("player1", this.props.your_round_score)};
        {this.renderGraph("player2", this.props.other_round_score)};
      </div>
      )
  }
});
