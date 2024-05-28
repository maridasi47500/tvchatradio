Rails.application.routes.draw do
  resources :interests
  resources :photopublics
  resources :photoprives
  get 'contacts/index'
  get 'settings/profile'
  get 'settings/research'
  get 'settings/album'
  get 'settings/interests'
  get 'settings/account'
  get 'conversations/index'
  get 'localize/index'

  get 'profile/tchatche/:id', to: "tchatche#chat"
  post 'tchatche/message', to: "tchatche#message"
  post 'tchatche/show', to: "tchatche#show"
  post 'tchatche/ilike', to: "tchatche#ilike"
  post 'tchatche/idontlike', to: "tchatche#idontlike"
  mount ActionCable.server => "/websocket" 

  get 'tchatche/chat'
  resources :posts
  get 'tchatche/:id', to: 'tchatche#profile'
  get 'delete/tchatche/:id', to: 'tchatche#delete'
  get 'search/index'
  get 'welcome/index'
  devise_for :users, controllers: { registrations: 'users/registrations', sessions: 'users/sessions' }
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  root "welcome#index"
end
