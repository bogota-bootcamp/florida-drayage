 function plantApp(){
  if (!App.chat){
    App.chat = App.cable.subscriptions.create("ChatChannel", {
      connected: function() {
        return console.log("conectado");
      },
      disconnected: function() {},
      received: function(data) {
        console.log(data);
        if (data.action === "new-message") {
          
          return $("#" + data.conversation_id).append(data.msg);
        }

        if (data.action === "new-conversation"){
          return $("#cart-container").prepend(`
            <li>
              <div class="client-card  d-flex flex-row align-items-center justify-content-center">
                <div class="col-2 col-height padding-0  flex-b ">
                  <i class="material-icons user-icon">person_pin</i>
                </div>
                <div class="col-7 col-height padding-0 d-flex flex-column justify-content-center align-items-user">
                  <p class="client-name">`+data.conversation.id+`- `+data.conversation.name+`</p>
                  <p class="client-mail">`+data.conversation.mail+` </p>
                </div>
                <div class="col-3 col-height padding-0 flex-b">
                  <a class="go-chat" data-remote="true" href="/conversations/`+data.conversation.id+`">></a>
                </div>
              </div>
            </li>
            `)
        }
      }
    });
  }
}

