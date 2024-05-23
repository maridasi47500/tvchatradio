class LocalizeController < ApplicationController
  def index
    render locals: {user: current_user}
  end
end
