class ConversationsController < ApplicationController
  def index
    @rooms=current_user.list_room
  end
end
