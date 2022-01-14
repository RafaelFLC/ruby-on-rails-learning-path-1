# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2022_01_13_210258) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "abilities", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "pokemon_abilities", id: false, force: :cascade do |t|
    t.bigint "pokemon_id"
    t.bigint "ability_id"
    t.integer "slot"
    t.index ["ability_id"], name: "index_pokemon_abilities_on_ability_id"
    t.index ["pokemon_id"], name: "index_pokemon_abilities_on_pokemon_id"
  end

  create_table "pokemon_stats", force: :cascade do |t|
    t.bigint "stat_id"
    t.bigint "pokemon_id"
    t.integer "value"
    t.index ["pokemon_id"], name: "index_pokemon_stats_on_pokemon_id"
    t.index ["stat_id"], name: "index_pokemon_stats_on_stat_id"
  end

  create_table "pokemon_types", id: false, force: :cascade do |t|
    t.bigint "pokemon_id"
    t.bigint "type_id"
    t.index ["pokemon_id"], name: "index_pokemon_types_on_pokemon_id"
    t.index ["type_id"], name: "index_pokemon_types_on_type_id"
  end

  create_table "pokemons", force: :cascade do |t|
    t.string "name"
    t.string "image"
    t.integer "height"
    t.integer "weight"
    t.integer "order"
    t.integer "n_of_moves"
    t.integer "pokemon_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "stats", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "types", force: :cascade do |t|
    t.string "name"
    t.integer "type_id"
    t.string "good_agains"
    t.string "bad_agains"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "user_pokemons", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "pokemon_id"
    t.integer "hp"
    t.integer "level"
    t.index ["pokemon_id"], name: "index_user_pokemons_on_pokemon_id"
    t.index ["user_id"], name: "index_user_pokemons_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "lastname"
    t.string "username"
    t.string "password_digest"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "role"
  end

  add_foreign_key "pokemon_abilities", "abilities"
  add_foreign_key "pokemon_abilities", "pokemons"
  add_foreign_key "pokemon_stats", "pokemons"
  add_foreign_key "pokemon_stats", "stats"
  add_foreign_key "pokemon_types", "pokemons"
  add_foreign_key "pokemon_types", "types"
  add_foreign_key "user_pokemons", "pokemons"
  add_foreign_key "user_pokemons", "users"
end
