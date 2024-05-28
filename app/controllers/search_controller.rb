class SearchController < ApplicationController
  before_action :authenticate_user!
  def index
    @users = current_user.list_tchatche.page(params[:page])
    render layout: "sometemplate"
  end
end
