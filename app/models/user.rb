# :string name
# :string lastname
# :string username
# :string password
# :string password_digest
# :integer role [1: admin, 2: normal]

class User < ApplicationRecord 
  has_secure_password 

  validates_uniqueness_of :username, on: :create, message: "username must be unique"
  validates_presence_of :username, on: :create, message: "username can't be blank"
  validates_presence_of :password, on: :create, message: "password can't be blank"
  validates_presence_of :name, on: :create, message: "name can't be blank"
  validates_presence_of :role, on: :create, message: "can't be blank"

  has_many :user_pokemons
  has_many :pokemons, through: :user_pokemons

  def self.new_by (params) 
    self.new(
      :name => params['name'], 
      :lastname => params['lastname'],
      :username => params['username'], 
      :password => params['password'],
    )
  end
end
