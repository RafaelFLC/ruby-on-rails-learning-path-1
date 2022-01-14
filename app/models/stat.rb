# :string name

class Stat < ApplicationRecord
  validates_presence_of :name, on: :create, message: "can't be blank"
  validates_uniqueness_of :name, on: :create, message: "must be unique"
end
