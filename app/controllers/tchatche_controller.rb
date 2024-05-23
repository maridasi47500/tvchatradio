class TchatcheController < ApplicationController
  before_action :authenticate_user!
  before_action :users
  def profile
    @user=User.find params[:id]
    render layout: "sometemplate", locals: {user: @user}
  end

  def chat
    @user=User.find params[:id]
    @room=search_room(@user.id)
    if !room
      @room=Room.create(user1_id:current_user.id, user1_id: @user.id)
    end
    render layout: "sometemplate", locals: {user: @user}
  end
  def users
    @users = current_user.list_tchatche
  end
end
