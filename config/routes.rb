Rails.application.routes.draw do
  # Gem Adminsitrate creates the routes to access users and expenses models in an admin site
  namespace :admin do
    resources :users
    resources :expenses

    root to: "users#index"
  end

  # creates routes for expenses model
  resources :expenses

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root :to => 'home#index'
end
