require 'rails_helper'

RSpec.describe Type, type: :model do
  let (:type) { Type.new :name => 'electric' }

  it "must have a name" do
    expect(type.name).not_to be_nil  
  end

  it "must be valid" do
    expect(type).to be_valid 
  end
end
