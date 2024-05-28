class ContactsController < ApplicationController
  before_action :authenticate_user!
  def index
    @favusers=current_user.favusers
    render layout: "sometemplate"
  end
end
