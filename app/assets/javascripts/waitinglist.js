var update_times_and_scores = function(){
    url = "/"
    $.ajax({
      url: url,
      type: 'GET',
      dataType: 'JSON'
    })
    .done(function(response) {
      for (var i = 0; i < response.times.length; i++){
        var x = i+1;
        $("#elapsed" + x).html(response.times[i]);
      };
      for (var i = 0; i < response.scores.length; i++){
        var x = i+1;
        $("#points" + x).html(response.scores[i]);
      };
    });

 }
