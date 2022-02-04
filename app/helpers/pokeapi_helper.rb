module PokeapiHelper
  require 'uri'
  require 'net/http'
 
  # Filter the pokemons 
  # requested list is from pokeapi (right list)
  # the bringed list must have a name field 
  # compare both list and return the left join
  # been the bringed list the left list
  def filter (by, value, list)
    by_name = false

    case by
    when 'name'
      url = 'pokemon?limit=10000'
      by_name = true
    when 'type'
      url = "type/#{value}"
    when 'ability'
      url = "ability/#{value}"
    end

    request = req url
    request = !by_name ? request['pokemon'] : request['results']

    requested_list = request.map { |p| 
      { :name => !by_name ? p['pokemon']['name'] : p['name'] }
    }

    if by_name 
      requested_list = requested_list.select { |p| p[:name].include? value.downcase }
    end

    unless list.nil? 
      return list.select { |p| requested_list.include? p }
    end

    requested_list
  end

  # Get details of specific pokemon
  # user is used to know if already liked or not 
  def details_of (pokemon_name, user)
    result = req("pokemon/#{pokemon_name.downcase}")    
    liked = user.pokemons.find_by_name pokemon_name

    {
      :name => pokemon_name, 
      :liked => ! liked.nil?,
      :height => result['height'], 
      :weight => result['weight'], 
      :image => image_from(result), 
      :types => types_from(result), 
      :stats => stats_from(result), 
      :n_of_moves => result['moves'].size, 
      :abilities => abilities_from(result)
    }

  end

  # Search pokemons by filters 
  # filters example:
  # [{:name => 'name', :value => 'pikachu'}, {:name => "type" ...}, {:name => 'ability' ...}]
  def search_by (filters, pokemons = nil) 
    search = filters.delete(filters[0])

    case search['name']
    when 'name'
      pokemons = filter('name', search['value'], pokemons)
    when 'type'
      pokemons = filter('type', search['value'], pokemons)
    when 'ability'
      pokemons = filter('ability', search['value'], pokemons)
    end

    return pokemons if filters.length <= 0

    search_by(filters, pokemons)
  end

  # Get a random pokemon from all existing
  def random 
    list = all_by 'pokemon'
    choosen = list[ rand list.length - 1 ]

    puts 'pokemon choosen'
    puts choosen

    pokemon = req( choosen['url'], is_partial: false )

    { 
      :name => pokemon['name'], 
      :image => image_from(pokemon) 
    }
  end

  # Get all by [ type, ability, ... ]
  def all_by (name)
    req( name.downcase + '?limit=10000' )['results']
  end

  private 

  # Get Requiest Response from @url + args  
  def req (args, is_partial: true) 
    url = is_partial ? URI('https://pokeapi.co/api/v2/' + args) : URI(args)
    puts url
    result = Net::HTTP.get_response(url)
    JSON.parse result.body
  end

  # Get the image from the pokemon (details)
  def image_from (pokemon) 
    sprites = pokemon['sprites']['other']
    img_type = 'front_default'

    img_dream = sprites['dream_world'][img_type]
    img_home = sprites['home'][img_type]
    img_artw = sprites['official-artwork'][img_type]

    return ! img_home.nil? ? img_home : (
      ! img_dream.nil? ? img_dream : img_artw
    )
  end

  # Get a csv format from array by attr
  def csv_from (array, attr = 'name') 
    array.map{ |x| x[attr]}.join ','
  end

  # Get the type data from specific pokemon
  def types_from (pokemon) 
    pokemon['types'].map { |t| 
      result = req t['type']['url'], is_partial: false

      puts 'result type'
      puts result['damage_relations']['double_damage_from']

      {
        :name => t['type']['name'], 
        :type_id => result['id'], 
        :good_agains => csv_from(result['damage_relations']['double_damage_to']), 
        :bad_agains => csv_from(result['damage_relations']['double_damage_from']), 
      } 
    }
  end

  # Get the stats of specific pokemon
  def stats_from (pokemon)
    pokemon['stats'].map { |s| 
      {
        :name => s['stat']['name'], 
        :stat => s['stat']['base_stat'], 
        :effort => s['stat']['effort']
      } 
    }
  end

  # Get the abilities from specific pokemon
  def abilities_from (pokemon)
    pokemon['abilities'].map { |a| 
      {
        :name => a['ability']['name'], 
        :slot => a['slot']
      } 
    }
  end

end