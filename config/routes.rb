Rails.application.routes.draw do
  resources :links
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  devise_for :users, controllers: { sessions: 'users/sessions' }

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  get "/l/:slug", to: "links#redirect_to_original", as: "redirect_to_original"
  post "/l/passwd/:slug", to: "links#check_password_link"

  # Defines the root path route ("/")
  root "home#index"

end
