require 'rails_helper'

RSpec.describe GroupPick, type: :model do
  before do
    @user = User.create(email: 'test@example.com', password: 'password')
    @group = Group.create(name: 'Group A')

    @valid_with_string_keys = { '1' => 1, '2' => 2, '3' => 3, '4' => 4 }
    @valid_with_integer_keys = { 1 => 1, 2 => 2, 3 => 3, 4 => 4 }
  end

  it { should belong_to(:user) }
  it { should belong_to(:group) }

  describe 'validations' do
    it 'is valid with integer keys' do
      group_pick = GroupPick.new(user: @user, group: @group, group_standings: @valid_with_integer_keys)

      expect(group_pick).to be_valid
    end

    it 'is valid with string keys' do
      group_pick = GroupPick.new(user: @user, group: @group, group_standings: @valid_with_string_keys)

      expect(group_pick).to be_valid
    end

    it 'is invalid without group_standings' do
      group_pick = GroupPick.new(user: @user, group: @group)

      expect(group_pick).to_not be_valid
      expect(group_pick.errors[:group_standings]).to include("can't be blank")
    end

    it 'is invalid with incorrect group_standings format' do
      invalid_standings = { '1' => 'one', '2' => 2, '3' => 3, '4' => 4 }
      group_pick = GroupPick.new(user: @user, group: @group, group_standings: invalid_standings)

      expect(group_pick).to_not be_valid
      expect(group_pick.errors[:group_standings]).to include(GroupPick::GROUP_STANDINGS_ERROR_MESSAGE)
    end

    it 'is invalid with incorrect keys' do
      invalid_standings = { 1 => 101, 2 => 102, 3 => 103 }
      group_pick = GroupPick.new(user: @user, group: @group, group_standings: invalid_standings)

      expect(group_pick).not_to be_valid
      expect(group_pick.errors[:group_standings]).to include(GroupPick::GROUP_STANDINGS_ERROR_MESSAGE)
    end

    it 'is invalid with non-integer values' do
      invalid_standings = { 1 => 'not_an_integer', 2 => 102, 3 => 103, 4 => 104 }
      group_pick = GroupPick.new(user: @user, group: @group, group_standings: invalid_standings)

      expect(group_pick).not_to be_valid
      expect(group_pick.errors[:group_standings]).to include(GroupPick::GROUP_STANDINGS_ERROR_MESSAGE)
    end
  end

  describe '#group_standings' do
    it 'returns keys as integers even if set with string keys' do
      group_pick = GroupPick.new(user: @user, group: @group, group_standings: @valid_with_string_keys)

      expect(group_pick.group_standings.keys).to all(be_a(Integer))
    end

    it 'returns keys as integers when set with integer keys' do
      group_pick = GroupPick.create(user: @user, group: @group, group_standings: @valid_with_integer_keys)

      expect(group_pick.group_standings.keys).to all(be_a(Integer))
    end
  end
end
