class CreatePokemonStats < ActiveRecord::Migration[6.1]
  def change
    create_table :pokemon_stats do |t|
      t.belongs_to :stat, class_name: "Stat", foreign_key: "stat_id"
      t.belongs_to :pokemon, class_name: "Pokemon", foreign_key: "pokemon_id"
      t.integer :value 
    end
  end
end
