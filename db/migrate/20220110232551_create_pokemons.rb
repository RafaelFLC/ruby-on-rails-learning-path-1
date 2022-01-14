class CreatePokemons < ActiveRecord::Migration[6.1]
  def change
    create_table :pokemons do |t|
      t.string :name
      t.string :image 
      t.integer :height
      t.integer :weight
      t.integer :order
      t.integer :n_of_moves
      t.integer :pokemon_id
      t.timestamps
    end
  end
end
