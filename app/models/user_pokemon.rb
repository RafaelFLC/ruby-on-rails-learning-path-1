class UserPokemon < ApplicationRecord 
    belongs_to :user
    belongs_to :pokemon

    def self.set_to(:user, :pokemon)
        user_pokemon = UserPokemon.new :hp => pokemon.hp, :level => 0, :pokemon_id => pokemon.id
        user.user_pokemons << user_pokemon
    end
end