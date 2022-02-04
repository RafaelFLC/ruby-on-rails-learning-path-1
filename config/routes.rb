Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root 'ui#react'

  namespace :api do
    resources :users, only: [:create]

    post 'pokemons/toggleLike', to: 'pokemon#toggle_like'
    post 'pokemons/getAllMine', to: 'pokemon#all_of_user'
    post 'pokemons/details', to: 'pokemon#get_details'
    post 'pokemons/random', to: 'pokemon#get_random'
    post 'pokemons/discover', to: 'pokemon#discover'
    post 'pokemons/all', to: 'pokemon#all'
    
    post 'auth/login', to: 'auth#login'
    post 'auth/signin', to: 'auth#signin'


  end

end
