class CreateTypes < ActiveRecord::Migration[6.1]
  def change
    create_table :types do |t|
      t.string :name
      t.integer :type_id
      t.string :good_agains
      t.string :bad_agains
      t.timestamps
    end
  end
end
