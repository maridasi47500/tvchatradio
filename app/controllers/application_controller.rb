class ApplicationController < ActionController::Base
  before_action do
    @whiteheart="&#129293;"
    @orangeheart="&#129505;"
  end
    before_action :myaction
      def myaction
            cookies.encrypted[:user_id]=current_user.try(:id)
              end

end
