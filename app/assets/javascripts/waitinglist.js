var update_times = function(){
    url = "/"
    $.ajax({
      url: url,
      type: 'GET',
      dataType: 'JSON'
    })
    .done(function(response) {
      for (var i = 0; i < response.length; i++){
        var x = i+1;
        $("#elapsed" + x).html(response[i]);
      }

    })
    .fail(function() {
      console.log("error");
    });
  }
