Rails.application.routes.draw do

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'ui#react'

  namespace :admin do 
    get '/', to: 'admin#index'
    get 'login', to: 'admin#login'

    resources :users do 
      member do 
        get :delete
      end
    end 

    # get 'users/index'
    # get 'users/show'
    # get 'users/new'
    # get 'users/edit'
  end
  
  namespace :api do
    resources :users, only: [:create]

    get 'pokemons/random', to: 'pokemon#get_random'
    
    post 'pokemons/toggleLike', to: 'pokemon#toggle_like'
    post 'pokemons/getAllMine', to: 'pokemon#all_of_user'
    post 'pokemons/details', to: 'pokemon#get_details'
    post 'pokemons/discover', to: 'pokemon#discover'
    post 'pokemons/all', to: 'pokemon#all'
    
    post 'auth/login', to: 'auth#login'
    post 'auth/signin', to: 'auth#signin'


  end

  # This is the else case on routes 
  # Any route not found will try to render the react router
  get '*path', to: 'ui#react', via: :all

end
