# pokemon_id
# type_id

class PokemonType < ApplicationRecord
  validates_presence_of :pokemon_id, on: :create, message: "can't be blank"
  validates_presence_of :type_id, on: :create, message: "can't be blank"
  
  def self.set_to(:pokemon, :params)
    type = Type.find_or_create_by(:name => params['name'], 
      :good_agains => params['good_agains'], 
      :bad_agains => params['bad_agains'],
      :type_id => params['type_id']
    )

    pokemon_type = PokemonType.new :type_id => type.id
    pokemon.pokemon_types << pokemon_type
  end
end
