# :string name 
# :integer type_id "type id form pokeapi"
# :string good_agains "csv"
# :string bad_agains "csv"

class Type < ApplicationRecord
  validates_presence_of :name, on: :create, message: "can't be blank"
  validates_uniqueness_of :name, on: :create, message: "must be unique"
  validates_presence_of :type_id, on: :create, message: "can't be blank"
  validates_presence_of :good_agains, on: :create, message: "can't be blank"
  validates_presence_of :bad_agains, on: :create, message: "can't be blank"
end
