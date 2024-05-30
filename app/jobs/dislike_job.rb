class DislikeJob < ApplicationJob
  queue_as :default

  def perform(user1,user2)
    # Do something later
    ActionCable.server.broadcast("fav_#{user1}", {user2:user2})
  end

end

