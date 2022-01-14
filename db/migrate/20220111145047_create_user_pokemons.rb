class CreateUserPokemons < ActiveRecord::Migration[6.1]
  def change
    create_table :user_pokemons do |t|
      t.belongs_to :user, class_name: "User", foreign_key: "user_id"
      t.belongs_to :pokemon, class_name: "Pokemon", foreign_key: "pokemon_id"
      t.integer :hp
      t.integer :level
    end
  end
end
