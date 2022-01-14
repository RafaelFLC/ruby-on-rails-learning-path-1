require 'rails_helper'

RSpec.shared_examples 'name_validations' do
  it 'must have a name' do
    expect(subject.name).not_to be_nil
  end

  it 'must be unique' do
    exist = described_class.find_by_name subject.name
    expect(exist).to be_nil
  end
end