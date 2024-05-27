class NewCommentJob < ApplicationJob
  queue_as :default

  def perform(room,message,userid,content)
    # Do something later
    ActionCable.server.broadcast("chat_#{room.id}", { postid: message.id,userid:userid,body: content})
  end

end

