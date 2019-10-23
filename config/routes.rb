Rails.application.routes.draw do
  resources :battles
  resources :stock_picks
  resources :stocks, only: [:index, :show]
  resources :users
  root :to => "welcome#home"
  get "/login", to: "sessions#new", as: "login"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy", as: "logout"
  get "/fight", to: "battles#fight"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
