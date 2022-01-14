class CreatePokemonTypes < ActiveRecord::Migration[6.1]
  def change
    create_table :pokemon_types, :id => false do |t|
      t.belongs_to :pokemon, class_name: "Pokemon", foreign_key: "pokemon_id"
      t.belongs_to :type, class_name: "Type", foreign_key: "type_id"
    end
  end
end
