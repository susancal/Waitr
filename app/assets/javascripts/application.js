// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require react
//= require react_ujs
//= require components
//= require_tree .

$(document).ready(function(e) {


    // var checker = setInterval(checkForFirstPlayer(), 5000)

  if ($("#wr").length > 0 ){
    console.log("eutfoirejfgiojrg");
    checkForFirstPlayer();
  }

  if ($(".prize-header").length > 0){
    console.log("home page!")
    // timer
  }

});



  var update_times = function(){
    $.ajax({
      url: '/restaurants/1',
      type: 'GET',
      dataType: 'JSON'
    })
    .done(function(response) {
      for (var i = 0; i < response.length; i++){
        var x = i+1;
        $("td.elapsed").html(response[i]);
      }

    })
    .fail(function() {
      console.log("error");
    });
  }



// var timer = setInterval(update_times, 1000);


      function formatTime(time, num){
        var $elapsedTag = $("<td>", {class: num})
      }

  function checkForFirstPlayer(){
    $.ajax({
      url: '/check',
      type: 'GET',
      dataType: 'JSON',
      data: {}
    })
    .done(function(response) {
      console.log(response)
      if (response === 2){
        console.log("THERE ARE 2!!!!!!!!!!!!!!!!");
        console.log(response);
        location.href="http://localhost:3000/match"
      } else if (response === 1){
        console.log("you are alone")
        console.log(response);
        setInterval(checkForFirstPlayer(), 5000);
      }
    })
    .fail(function() {
      console.log("error");
    });

  }

  console.log(typeof update_times);
// var timer = setInterval(update_times, 100000);
  // timer;



