
App.chat = App.cable.subscriptions.create "ChatChannel",
  connected: ->
    # Called when the subscription is ready for use on the server
    console.log("conectado")

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    # Called when there's incoming data on the websocket for this channel    
    if data.action == "created"    	    	
    	$("#"+ data.conversation_id).append(data.msg)
