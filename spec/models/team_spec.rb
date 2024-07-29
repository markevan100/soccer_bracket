require 'rails_helper'

RSpec.describe Team, type: :model do
  it { should belong_to(:group) }
  it { should have_many(:matches_as_team_a).class_name('Match').with_foreign_key('team_a_id') }
  it { should have_many(:matches_as_team_b).class_name('Match').with_foreign_key('team_b_id') }

  it 'is valid with valid attributes' do
    group = Group.create(name: 'Group A')
    team = Team.new(country: 'Country A', group: group)
    expect(team).to be_valid
  end

  it 'is not valid without a country' do
    team = Team.new(country: nil)
    expect(team).to_not be_valid
  end

  it 'is not valid without a group' do
    team = Team.new(country: 'Country A', group: nil)
    expect(team).to_not be_valid
  end

  describe '#matches' do
    let(:group) { Group.create(name: 'Group A') }
    let(:team) { Team.create(country: 'Country A', group: group) }
    let(:other_team) { Team.create(country: 'Country B', group: group) }

    let!(:match_as_team_a) { Match.create(team_a: team, team_b: other_team, group: group, date: DateTime.now, team_a_goals: 1, team_b_goals: 2) }
    let!(:match_as_team_b) { Match.create(team_a: other_team, team_b: team, group: group, date: DateTime.now, team_a_goals: 3, team_b_goals: 4) }

    it 'returns all matches where the team is either team_a or team_b' do
      matches = team.matches

      expect(matches).to include(match_as_team_a, match_as_team_b)
      expect(matches.count).to eq(2)
    end
  end
end
