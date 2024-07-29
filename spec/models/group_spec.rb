require 'rails_helper'

RSpec.describe Group, type: :model do
  it { should have_many(:teams) }
  it { should have_many(:matches) }

  it 'is valid with valid attributes' do
    group = Group.new(name: 'Group A')
    expect(group).to be_valid
  end

  it 'is not valid without a name' do
    group = Group.new(name: nil)
    expect(group).to_not be_valid
  end
end
