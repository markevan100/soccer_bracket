require 'rails_helper'

RSpec.describe UserPick, type: :model do
  before do
    @user = User.create(email: 'test@example.com', password: 'password')
    @group = Group.create(name: 'Group A')
    @team_a = Team.create(country: 'Team A', group: @group)
    @team_b = Team.create(country: 'Team B', group: @group)
    @match = Match.create(team_a: @team_a, team_b: @team_b, date: Time.now)
  end

  context 'validations' do
    it 'is valid with valid attributes' do
      user_pick = UserPick.new(user: @user, match: @match, predicted_winner: @team_a)
      expect(user_pick).to be_valid
    end

    it 'is invalid without a user' do
      user_pick = UserPick.new(match: @match, predicted_winner: @team_a)
      expect(user_pick).to_not be_valid
    end

    it 'is invalid without a match' do
      user_pick = UserPick.new(user: @user, predicted_winner: @team_a)
      expect(user_pick).to_not be_valid
    end

    it 'is invalid without a predicted winner' do
      user_pick = UserPick.new(user: @user, match: @match)
      expect(user_pick).to_not be_valid
    end
  end

  context 'associations' do
    it { should belong_to(:user) }
    it { should belong_to(:match) }
    it { should belong_to(:predicted_winner).class_name('Team').with_foreign_key('predicted_winner_id') }
  end
end
