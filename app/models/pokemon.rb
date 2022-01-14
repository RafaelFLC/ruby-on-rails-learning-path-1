# :string name
# :string image 
# :integer height
# :integer weight
# :integer n_of_moves

class Pokemon < ApplicationRecord
  has_many :user_pokemon
  has_many :pokemon_types
  has_many :pokemon_stats
  has_many :pokemon_abilities 

  has_many :stats, through: :pokemon_stats
  has_many :types, through: :pokemon_types
  has_many :abilities, through: :pokemon_abilities

  validates_presence_of :name, on: :create, message: "Name can't be blank"
  validates_uniqueness_of :name, on: :create, message: "Pokemon must be unique"
    
  end

  def self.create_with(:params, :stats, :types, :abilities)
    pokemon = Pokemon.new_by params

    stats.each { |s| PokemonStat.set_to(pokemon, s) }
    types.each { |t| PokemonType.set_to(pokemon, t) }
    abilities.each { |a| PokemonAbility.set_to(pokemon, a) }

    return pokemon if pokemon.save
  end

  def self.new_by (params) 
    Pokemon.new :name => params['name'], 
      :image => params['image'], 
      :height => params['height'], 
      :weight => params['weight'],
      :order => params['order'], 
      :n_of_moves => params['n_of_moves'], 
      :pokemon_id => params['pokemon_id']
  end
end