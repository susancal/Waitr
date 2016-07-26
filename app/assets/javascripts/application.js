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
//= require_tree ./channels
//= require jquery
//= require jquery_ujs
//= require d3
//= require react
//= require react_ujs
//= require components
//= require_tree .

$(document).ready(function(e) {

  if ($("#wr").length > 0 ){
    console.log("eutfoirejfgfcdafiojrg");
    setTimeout(checkForFirstPlayer, 2000)
  }

  if ($(".prize-header").length > 0){
    console.log("home page!")
    // timer
  }
});

  // var update_times = function(){
  //   $.ajax({
  //     url: '/restaurants/1',
  //     type: 'GET',
  //     dataType: 'JSON'
  //   })
  //   .done(function(response) {
  //     for (var i = 0; i < response.length; i++){
  //       var x = i+1;
  //       $("td.elapsed").html(response[i]);
  //     }

  //   })
  //   .fail(function() {
  //     console.log("error");
  //   });
  // }

    // var timer = setInterval(update_times, 1000);


      // function formatTime(time, num){
      //   var $elapsedTag = $("<td>", {class: num})
      // }

  function checkForFirstPlayer(){
    var id = $("#key").text()
    console.log(id);
    var checker;
    $.ajax({
      url: '/check',
      type: 'GET',
      dataType: 'JSON',
      data: {}
    })
    .done(function(response) {
      console.log(response.length)
      if (response.length === 2){
        url = "http://localhost:3000/rounds/key/" + id
        console.log(response);
        location.href=url;
      } else if (response.length === 1){
        console.log("you are alone")
        console.log(response);
        setTimeout(checkForFirstPlayer, 1000)
      }
    })
    .fail(function() {
      console.log("error");
    });

  }
// var timer = setInterval(update_times, 100000);
  // timer;
