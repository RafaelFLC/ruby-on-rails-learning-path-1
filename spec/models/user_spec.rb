require 'rails_helper'

RSpec.describe User, type: :model do

  subject { User.create(:username => 'rlopez', :password => '123', :name => 'Rafael', :role => 1) } 

  it "must have a username" do
    expect(subject.username).not_to be_nil
  end

  it "must have a password" do
    expect(subject.password).not_to be_nil  
  end

  it "must be valid and save" do
    expect(subject).to be_valid
    expect(subject.save).to be true  
  end

  it 'must be avaiable to save' do
    result = subject.save
    expect(result).to be_truthy
  end

  it "must be avaible to search by username" do
    result = described_class.find_by_username(subject.username)
    expect(result).to be_nil  
  end

  it 'must authenticate' do 
    result = subject.authenticate('123')
    expect(result).not_to be_nil
  end

end
