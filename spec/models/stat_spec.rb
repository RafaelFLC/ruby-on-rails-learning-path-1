require 'rails_helper'

RSpec.describe Stat, type: :model do
  let (:stat) { Stat.new :name => 'hp' }

  it "must have a name" do
    expect(stat.name).not_to be_nil
  end

end
