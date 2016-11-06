Rails.application.routes.draw do
  namespace :admin do
    resources :users
resources :expenses

    root to: "users#index"
  end

  resources :expenses
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root :to => 'home#index'
end
