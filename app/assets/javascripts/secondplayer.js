function checkForFirstPlayer(){
    var id = $("#key").text()
    var checker;
    $.ajax({
      url: '/check',
      type: 'GET',
      dataType: 'JSON'
    })
    .done(function(response) {
      if (response === 2){
        setTimeout(function(){
          url = "/rounds/key/" + id
          window.location = url;
        }, 2000)
      } else if (response === 1){
        console.log("you are alone");
      }
    })
    .fail(function() {
      console.log("error");
    });
};



$(function() {
(function blink() {
  $('#waiting').fadeOut(500).fadeIn(500, blink);
  })();
})
