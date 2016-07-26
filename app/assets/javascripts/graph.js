$.ajax({
  type: "GET",
  contentType: "application/json; charset=utf-8",
  url: '/rounds/data/123456',
  success: function(data) {
    console.log("THE AJAX WORKED");
    console.log(data);
    draw(data);
  }
})

function draw(data) {
  console.log("THIS IS THE D3 DATA");
  console.log(data);
  console.log(typeof data);
  console.log(typeof [0, 1]);



  var dataset = {
    apples: data,
  };

  var width = 460,
  height = 300,
  radius = Math.min(width, height) / 2;

  var color = d3.scale.category20();

  var pie = d3.layout.pie()
  .sort(null);

  var arc = d3.svg.arc()
  .innerRadius(radius - 100)
  .outerRadius(radius - 50);

  var svg = d3.select("player_1").append("svg")
  .attr("width", width)
  .attr("height", height)
  .append("g")
  .attr("transform", "translate(" + width / 2 + "," + height / 2 + ")");

  var path = svg.selectAll("path")
  .data(pie(dataset.apples))
  .enter().append("path")
  .attr("fill", function(d, i) { return color(i); })
  .attr("d", arc);
};
