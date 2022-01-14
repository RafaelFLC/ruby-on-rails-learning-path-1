# pokemon_id
# ability_id
# slot

class PokemonAbility < ApplicationRecord
  validates_presence_of :pokemon_id, on: :create, message: "can't be blank"
  validates_presence_of :ability_id, on: :create, message: "can't be blank"

  def self.set_to(:pokemon, :params)
    ability = Ability.find_or_create_by(:name => params['name'])
    pokemon_ability = PokemonAbility.new :ability_id => ability.id, :slot => params['slot']
    pokemon.pokemon_abilities << pokemon_ability
  end
end
