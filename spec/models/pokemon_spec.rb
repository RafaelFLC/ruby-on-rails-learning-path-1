require 'rails_helper'
Dir[Rails.root.join("spec/shared/**/*.rb")].each { |f| require f }

RSpec.describe Pokemon, type: :model do

  subject { Pokemon.new :name => 'Pikachu' } 

  include_examples 'name_validations'

end
