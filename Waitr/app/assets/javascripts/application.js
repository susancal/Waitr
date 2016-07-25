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

  console.log("Yep!");


  // $(".container").on('click', function(event) {
  //   event.preventDefault();
  //   console.log("clicked");
  //   update_times();
  // });

  var update_times = function(){
    $.ajax({
      url: '/restaurants/1',
      type: 'GET',
      dataType: 'JSON'
    })
    .done(function(response) {
      console.log("success");
      for (var i = 0; i < response.length; i++){
        var x = i+1;
        $("td.elapsed").html(response[i]);
      }

    })
    .fail(function() {
      console.log("error");
    });
  }

  console.log(typeof update_times);
var timer = setInterval(update_times, 100000);
  timer;


});

function formatTime(time, num){
  var $elapsedTag = $("<td>", {class: num})
}
