Rails.application.routes.draw do
  resources :decks
  resources :tweets
  ActiveAdmin.routes(self)
  devise_for :users
  as :user do
  	get "signin" => 'devise/sessions#new'
  	delete "signout" => 'devise/sessions#destroy'
  	get "signup" => 'devise/registrations#new'
  	#get "signup" => redirect("http://us.battle.net/hearthstone/en/"), :as => :signup
  end
  root 'pages#home'
  get 'about' => 'pages#about'
  get 'contact' => 'pages#contact'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
