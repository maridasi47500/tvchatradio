class NewProfileFavJob < ApplicationJob
  queue_as :default

  def perform(user1,user2,ilike)
    # Do something later
    ActionCable.server.broadcast("profile_#{user1}_#{user2}", {ilike: ilike})
  end

end

