class ProfileChannel < ApplicationCable::Channel
  def subscribed
        stream_from "profile_#{params[:user1]}_#{params[:user2]}"
          end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
