App.gameplay = App.cable.subscriptions.create "GameplayChannel",
  connected: ->
    # Called when the subscription is ready for use on the server
    $('body').append("GAME READY")
  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    console.log(data)
