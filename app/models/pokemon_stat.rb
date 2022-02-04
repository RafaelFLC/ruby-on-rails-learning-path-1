# stat_id
# pokemon_id
# :integer value

class PokemonStat < ApplicationRecord
  validates_presence_of :stat_id, on: :create, message: "can't be blank"
  validates_presence_of :pokemon_id, on: :create, message: "can't be blank"

  def self.set_to(pokemon, params)
    stat = Stat.find_or_create_by :name => params['name']
    pokemon_stat = PokemonStat.new :value => params['value'], :stat_id => stat.id
    pokemon.pokemon_stat << pokemon_stat
  end
end
