Rails.application.routes.draw do

  #get 'users/:username', to: "users#show", as: 'user'
  ActiveAdmin.routes(self)
  devise_for :users
  as :user do
    get "signin", to: 'devise/sessions#new'
    delete "signout", to: 'devise/sessions#destroy'
    get "signup", to: 'devise/registrations#new'
    #get "signup" => redirect("http://us.battle.net/hearthstone/en/"), :as => :signup
  end
  get 'feed', to: 'feed#show'

  resources :decks
  resources :decks, only: :show, param: :id do
    member do
      post 'follow', to: 'follows#create'
      delete 'unfollow', to: 'follows#destroy'
    end
  end

  resources :items do
    member do
      post 'vote', to: 'votes#create'
      post 'unvote', to: 'votes#destroy'
    end
  end


  resources :items
  
  resources :tweets
  
  root 'pages#home'
  get 'about', to: 'pages#about'
  get 'contact', to: 'pages#contact'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
