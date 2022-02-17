module Admin
  class AdminController < ApplicationController
    def index
      @totals = {
        :users => User.all.length,
        :pokemons => Pokemon.all.length,
        :types => Type.all.length,
        :abilities => Ability.all.length,
        :stats => Stat.all.length
      }
    end

    def login 
    end

  end
end
