class SettingsController < ApplicationController
  before_action :authenticate_user!
  def profile
    render layout: "settings"
  end

  def research
    render layout: "settings"
  end

  def album
    render layout: "settings"
  end

  def interests
    render layout: "settings"
  end

  def account
    render layout: "settings"
  end
end
