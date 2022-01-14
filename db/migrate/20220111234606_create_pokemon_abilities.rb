class CreatePokemonAbilities < ActiveRecord::Migration[6.1]
  def change
    create_table :pokemon_abilities, :id => false do |t|
      t.belongs_to :pokemon, class_name: "pokemon", foreign_key: "pokemon_id"
      t.belongs_to :ability, class_name: "ability", foreign_key: "ability_id"
      t.integer :slot
    end
  end
end
