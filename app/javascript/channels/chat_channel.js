import consumer from "channels/consumer"


consumer.subscriptions.create({ channel: "ChatChannel", room: "Best Room" })

consumer.subscriptions.create({ channel: "ChatChannel", room: "1st Room" })
consumer.subscriptions.create({ channel: "ChatChannel", room: "2nd Room" })

if (document.querySelector("[data-room-id]")){
consumer.subscriptions.create({ channel: "ChatChannel", room: document.querySelector("[data-room-id]").dataset.roomId }, {
	  received(data) {
		      this.appendLine(data)
		    },

	  appendLine(data) {
		      const html = this.createLine(data)
		      const element = document.querySelector("[data-room-id='"+document.querySelector("[data-room-id]").dataset.roomId+"']")
		      element.insertAdjacentHTML("beforeend", html)
		    },

	  createLine(data) {
		  if (String(data.userid) === document.querySelector("#myuserid").innerHTML){
		      return `
		      <div class="talk-bubble tri-right myborder round btm-left-in">
		          <div class="talktext">
				            <p>${data.body}</p>
				              </div>
					      </div>
						      `
		  }else{
		      return `
		      <div class="talk-bubble tri-right myborder btm-right-in">
		          <div class="talktext">
				            <p>${data.body}</p>
				              </div>
				  </div>
						      `
		  }
		    }
})
}
