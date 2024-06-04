class SearchController < ApplicationController
  before_action :authenticate_user!
  def index

    @search=Search.new(search_params)
    @search.min||=18
    @search.min1||=180
    @search.max||=70
    @search.max1||=700
    @users = current_user.list_tchatche.getallusers(@search).page(params[:page])
    render layout: "sometemplate"
  end
  def search_params
    params.require(:search).permit(:nickname,:min,:min1,:max,:max1,:profilepic,:profilealbum,:pays,:typeami,:typefun,:typeserieux,:isearchwoman,:isearchman)
  rescue
    params.permit("azertyui")
  end
end
