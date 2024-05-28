import consumer from "channels/consumer"


//.consumer.subscriptions.create({ channel: "ProfileChannel", user1: "lol",user2:"oops" })
//.
//.consumer.subscriptions.create({ channel: "ProfileChannel", user1: "poiuyt",user2:"azerty" })
//.consumer.subscriptions.create({ channel: "ProfileChannel",user1:"qa",user2:"hh" })


consumer.subscriptions.create({ channel: "ProfileChannel", user1: document.querySelector("#myuserid").innerHTML,user2: document.querySelector("#tchatcheid").innerHTML }, {
	  received(data) {
		  console.log("LOL");
		      this.appendLine(data)
		    },

	  appendLine(data) {
		  console.log("LOL");
		      const html = this.createLine(data)

		      const element = document.querySelector(".profile.heart")
		      element.innerHTML = html;
		    },

	  createLine(data) {
		  if (data.ilike){
		      return `&#129505;`
		  }else{
		      return `&#129293;`
		  }
		    }
})
