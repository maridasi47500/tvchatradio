import consumer from "channels/consumer"


//.consumer.subscriptions.create({ channel: "FavChannel", user1: "lol",user2:"oops" })
//.
//.consumer.subscriptions.create({ channel: "FavChannel", user1: "poiuyt",user2:"azerty" })
//.consumer.subscriptions.create({ channel: "FavChannel",user1:"qa",user2:"hh" })


consumer.subscriptions.create({ channel: "FavChannel",user1: document.querySelector("#myuserid").innerHTML }, {
	  received(data) {
		  console.log("LOL");
		      this.appendLine(data)
		    },

	  appendLine(data) {
		  console.log("LOL");

		  var wow=document.querySelector("#seeprofilelike"+data.user2);
                      if (wow){
			      wow.remove();
		      }

		    },

})
