class SearchController < ApplicationController
  before_action :authenticate_user!
  def index
    @users = current_user.list_tchatche.page(params[:page])
    @search=Search.new(search_params)
    @search.min||=30
    @search.min1||=30
    @search.max||=70
    @search.max1||=70
    render layout: "sometemplate"
  end
  def search_params
    params.require(:search).permit(:nickname,:min,:min1,:max,:max1,:profilestuff,:pays,:typeami,:typefun,:typeserieux,:isearchwoman,:isearchman)
  rescue
    params.permit("azertyui")
  end
end
