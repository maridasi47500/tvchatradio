import consumer from "channels/consumer"


consumer.subscriptions.create({ channel: "ChatChannel", room: "Best Room" })

consumer.subscriptions.create({ channel: "ChatChannel", room: "1st Room" })
consumer.subscriptions.create({ channel: "ChatChannel", room: "2nd Room" })
