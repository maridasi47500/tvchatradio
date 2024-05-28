class ApplicationController < ActionController::Base
  after_action :user_activity
  protect_from_forgery except: [:myaction]
  protect_from_forgery unless: -> { request.format.json? }


  before_action :hey
  def hey
    @whiteheart="&#129293;"
    @orangeheart="&#129505;"
    @users=User.onlineusers.page(params[:page]).per(10)
  end
    before_action :myaction
      def myaction
            cookies.encrypted[:user_id]=current_user.try(:id)
              end
  private

  def user_activity
      current_user.try :touch
  end

end
