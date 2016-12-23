Rails.application.routes.draw do
  get 'users/:username', to: "users#show", as: 'user'

  resources :items
  resources :decks
  resources :tweets
  ActiveAdmin.routes(self)
  devise_for :users
  as :user do
  	get "signin", to: 'devise/sessions#new'
  	delete "signout", to: 'devise/sessions#destroy'
  	get "signup", to: 'devise/registrations#new'
  	#get "signup" => redirect("http://us.battle.net/hearthstone/en/"), :as => :signup
  end
  root 'pages#home'
  get 'about', to: 'pages#about'
  get 'contact', to: 'pages#contact'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
