class SearchController < ApplicationController
  before_action :authenticate_user!
  def index
    @users = current_user.list_tchatche.page(params[:page])
    @earch=Search.new(search_params)
    render layout: "sometemplate"
  end
  def search_params
  end
end
