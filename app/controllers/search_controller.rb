class SearchController < ApplicationController
  before_action :authenticate_user!
  def index
    @users = current_user.list_tchatche
  end
end
