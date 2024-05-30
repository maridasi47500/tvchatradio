class TchatcheController < ApplicationController
  before_action :authenticate_user!
  before_action :users
  protect_from_forgery except: [:message]
  def profile
    @user=User.find params[:id]
    render layout: "sometemplate", locals: {user: @user}
  end
  def ilike
    @like=Ilike.find_or_create_by(user1_id:params[:user1],user2_id:params[:user2])
    NewProfileFavJob.perform_later(params[:user1],params[:user2],true)
  end
  def idontlike
    @like=Ilike.find_by(user1_id:params[:user1],user2_id:params[:user2])
    if @like
      @like.destroy
    end
    DislikeJob.perform_later(params[:user1],params[:user2])

  end
  def show
    params[:page] ||= 1
    @users = User.onlineusers.page(params[:page]).per(10)
                      respond_to do |format|
                          format.js  { render 'show.js.erb' }
                              format.html
                                end
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

  def delete
    @user=User.find params[:id]
    @room=current_user.search_room(@user.id)
    if @room
      @room.destroy
    end
    redirect_to("/conversations/index")

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
