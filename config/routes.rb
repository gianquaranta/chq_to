Rails.application.routes.draw do
  resources :links
  resource :user 
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  devise_for :users, controllers: { sessions: 'users/sessions' }

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  get "/link/:slug", to: "links#redirect_to_original", as: "redirect_to_original"
  post "/link/password/:slug", to: "links#check_password_link", as: "check_password_link"

  # Defines the root path route ("/")
  root "home#index"

end
