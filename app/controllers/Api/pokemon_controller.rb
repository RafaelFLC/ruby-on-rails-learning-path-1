module Api
  class PokemonController < ApiController
    before_action :is_valid_jwt

    # Create Pokemon if not exist with stats, types and abilities 
    # Create user_pokemon relation if not exist or Remove it if already exist 
    def toggle_like
      errors = []
      result = false
      user = User.find @token_decode['id']
      pokemon_name = params['pokemon']['name']
      exist_user_pokemon = user.pokemons.find_by_name pokemon_name

      begin
        if exist_user_pokemon.nil? 
          pokemon = Pokemon.find_by_name pokemon_name
  
          if pokemon.nil?
            stats = params['pokemon'].delete('stats')
            types = params['pokemon'].delete('types')
            abilities = params['pokemon'].delete('abilities')
            pokemon = Pokemon.create_with :params => params['pokemon']
          end
  
          UserPokemon.set_to :user => user, :pokemon => pokemon
          result = user.save
        else 
          result = user.user_pokemons.find_by_pokemon_id(exist_user_pokemon.id).destroy
        end

      rescue => exception
        puts exception
        errors = exception
        result = false
      end

      render :json => {:result => result, :errors => error}
    end

    # Get all the pokemons of the user
    def all_of_user 
      user = User.find @token_decode['id']
      user_pokemons = user.user_pokemons

      pokemons = user_pokemons.map do |up|
        current = Pokemon.find up.pokemon_id
        pokemon_stats = current.stats
        pokemon_stats[:hp] = up.hp
        pokemon_stats[:level] = up.level

        current[:stats] => pokemon_stats
        current[:types] => current.types
        current[:abilities] => current.abilities

        current
      end

      render :json => pokemons
    end

    # Search pokemons from Pokeapi by
    # Name, tags, abilities
    def discover 
      
    end

  end
end