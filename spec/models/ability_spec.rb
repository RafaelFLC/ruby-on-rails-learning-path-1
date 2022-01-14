require 'rails_helper'
Dir[Rails.root.join("spec/shared/**/*.rb")].each {|f| require f}

RSpec.describe Ability, type: :model do

  subject { Ability.new :name => 'static' } 

  include_examples 'name_validations'
end
