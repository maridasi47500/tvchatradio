class WelcomeController < ApplicationController
  def index
    #ActionCable.server.broadcast("chat_Best Room", { body: "This Room is Best Room." })
  end
end
