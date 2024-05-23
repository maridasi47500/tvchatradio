class ConversationsController < ApplicationController
  before_action :authenticate_user!
  def index
    @rooms=current_user.list_room
  end
end
