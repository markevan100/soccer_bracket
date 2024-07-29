require 'rails_helper'

RSpec.describe User, type: :model do
  context 'validations' do
    it 'is valid with valid attributes' do
      user = User.create(email: 'test@example.com', password: 'password')
      expect(user).to be_valid
    end

    it 'is invalid without an email' do
      user = User.new(password: 'password')
      expect(user).to_not be_valid
    end

    it 'is invalid without a password' do
      user = User.new(email: 'test@example.com')
      expect(user).to_not be_valid
    end
  end

  context 'associations' do
    it { should have_many(:group_picks) }
    it { should have_many(:user_picks) }
  end
end
