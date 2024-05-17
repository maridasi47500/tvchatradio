class NewCommentJob < ApplicationJob
  queue_as :default

  def perform(room,post)
    # Do something later
    PostsChannel.broadcast_to(room, post)
  end

end
