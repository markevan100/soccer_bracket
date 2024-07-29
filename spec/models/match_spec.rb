require 'rails_helper'

RSpec.describe Match, type: :model do
  it { should belong_to(:group) }
  it { should belong_to(:team_a).class_name('Team') }
  it { should belong_to(:team_b).class_name('Team') }

  it 'is valid with valid attributes' do
    group = Group.create(name: 'Group A')
    team_a = Team.create(country: 'Country A', group: group)
    team_b = Team.create(country: 'Country B', group: group)
    match = Match.new(
      team_a: team_a, 
      team_b: team_b, 
      group: group, 
      date: DateTime.now,
      team_a_goals: 0,
      team_b_goals: 0
    )
    expect(match).to be_valid
  end

  it 'is not valid without team_a' do
    group = Group.create(name: 'Group A')
    team_b = Team.create(country: 'Country B', group: group)
    match = Match.new(
      team_a: nil, 
      team_b: team_b, 
      group: group, 
      date: DateTime.now,
      team_a_goals: 0,
      team_b_goals: 0
    )
    expect(match).to_not be_valid
  end

  it 'is not valid without team_b' do
    group = Group.create(name: 'Group A')
    team_a = Team.create(country: 'Country A', group: group)
    match = Match.new(
      team_a: team_a, 
      team_b: nil, 
      group: group, 
      date: DateTime.now,
      team_a_goals: 0,
      team_b_goals: 0
    )
    expect(match).to_not be_valid
  end

  it 'is not valid without a group' do
    team_a = Team.create(country: 'Country A')
    team_b = Team.create(country: 'Country B')
    match = Match.new(
      team_a: team_a, 
      team_b: team_b, 
      group: nil, 
      date: DateTime.now,
      team_a_goals: 0,
      team_b_goals: 0
    )
    expect(match).to_not be_valid
  end

  it 'is not valid without team_a_goals' do
    group = Group.create(name: 'Group A')
    team_a = Team.create(country: 'Country A', group: group)
    team_b = Team.create(country: 'Country B', group: group)
    match = Match.new(
      team_a: team_a, 
      team_b: team_b, 
      group: group, 
      date: DateTime.now,
      team_a_goals: nil,
      team_b_goals: 0
    )
    expect(match).to_not be_valid
  end

  it 'is not valid without team_b_goals' do
    group = Group.create(name: 'Group A')
    team_a = Team.create(country: 'Country A', group: group)
    team_b = Team.create(country: 'Country B', group: group)
    match = Match.new(
      team_a: team_a, 
      team_b: team_b, 
      group: group, 
      date: DateTime.now,
      team_a_goals: 0,
      team_b_goals: nil
    )
    expect(match).to_not be_valid
  end
end
