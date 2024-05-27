class TchatcheController < ApplicationController
  before_action :authenticate_user!
  before_action :users
  protect_from_forgery except: [:message]
  def profile
    @user=User.find params[:id]
    render layout: "sometemplate", locals: {user: @user}
  end
  def message
    tchatcheid=params[:tchatche_id]
    mycurrentuserid=params[:current_user_id]
    @user=User.find tchatcheid
    @room=User.find(mycurrentuserid).search_room(@user.id)

    content=params[:content]
    @message=Post.create(user_id:mycurrentuserid,room_id:@room.id,content:content)
    NewCommentJob.perform_later(@room,@message,mycurrentuserid,content)
  end

  def chat
    @user=User.find params[:id]
    @room=current_user.search_room(@user.id)
    if !@room
      @room=Room.create(user1_id:current_user.id, user2_id: @user.id)
    end
    render layout: "sometemplate", locals: {user: @user}
  end
  def users
    @users = current_user.list_tchatche
  end
end
