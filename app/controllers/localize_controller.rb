class LocalizeController < ApplicationController
  def index
    render locals: {user: current_user}
  end
  def localization
    current_user.update(lat:params[:lat],lon:params[:lon])
    redirect_to localize_index_path
  end
end
