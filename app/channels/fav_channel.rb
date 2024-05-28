class FavChannel < ApplicationCable::Channel
  def subscribed
    stream_from "fav_#{params[:user1]}"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
