 function plantApp(){
  if (!App.chat){
    App.chat = App.cable.subscriptions.create("ChatChannel", {
      connected: function() {
        return console.log("conectado");
      },
      disconnected: function() {},
      received: function(data) {
        if (data.action === "created") {
          console.log(data);
          return $("#" + data.conversation_id).append(data.msg);
        }
      }
    });
  }
}

