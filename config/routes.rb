Rails.application.routes.draw do
  get 'conversations/index'
  get 'localize/index'
  get 'profile/tchatche/:id', to: "tchatche#chat"
  get 'tchatche/chat'
  resources :posts
  get 'tchatche/:id', to: 'tchatche#profile'
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
