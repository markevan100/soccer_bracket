# Create Groups
group_a = Group.create(name: "Group A")
group_b = Group.create(name: "Group B")
group_c = Group.create(name: "Group C")

# Create Teams
teams = {
  "France" => { group: group_a },
  "Canada" => { group: group_a },
  "Colombia" => { group: group_a },
  "New Zealand" => { group: group_a },
  "Germany" => { group: group_b },
  "United States" => { group: group_b },
  "Australia" => { group: group_b },
  "Zambia" => { group: group_b },
  "Spain" => { group: group_c },
  "Brazil" => { group: group_c },
  "Japan" => { group: group_c },
  "Nigeria" => { group: group_c }
}

teams.each do |name, attrs|
  Team.create(country: name, group: attrs[:group])
end

# Create Matches
Match.create(
  team_a: Team.find_by(country: "France"), team_b: Team.find_by(country: "Colombia"),
  team_a_goals: 3, team_b_goals: 2, team_a_yellow_cards: 0, team_b_yellow_cards: 0, team_a_red_cards: 0, team_b_red_cards: 0, group: group_a
)
Match.create(
  team_a: Team.find_by(country: "Canada"), team_b: Team.find_by(country: "New Zealand"),
  team_a_goals: 2, team_b_goals: 1, team_a_yellow_cards: 1, team_b_yellow_cards: 0, team_a_red_cards: 0, team_b_red_cards: 0, group: group_a
)
Match.create(
  team_a: Team.find_by(country: "Germany"), team_b: Team.find_by(country: "Australia"),
  team_a_goals: 3, team_b_goals: 0, team_a_yellow_cards: 1, team_b_yellow_cards: 1, team_a_red_cards: 0, team_b_red_cards: 0, group: group_b
)
Match.create(
  team_a: Team.find_by(country: "United States"), team_b: Team.find_by(country: "Zambia"),
  team_a_goals: 3, team_b_goals: 0, team_a_yellow_cards: 0, team_b_yellow_cards: 1, team_a_red_cards: 0, team_b_red_cards: 1, group: group_b
)
Match.create(
  team_a: Team.find_by(country: "Spain"), team_b: Team.find_by(country: "Japan"),
  team_a_goals: 2, team_b_goals: 1, team_a_yellow_cards: 2, team_b_yellow_cards: 0, team_a_red_cards: 0, team_b_red_cards: 0, group: group_c
)
Match.create(
  team_a: Team.find_by(country: "Brazil"), team_b: Team.find_by(country: "Nigeria"),
  team_a_goals: 1, team_b_goals: 0, team_a_yellow_cards: 1, team_b_yellow_cards: 0, team_a_red_cards: 0, team_b_red_cards: 0, group: group_c
)

# Create Users
user1 = User.create(email: "user1@example.com", password: "password")
user2 = User.create(email: "user2@example.com", password: "password")
user3 = User.create(email: "user3@example.com", password: "password")

# Create Group Picks
GroupPick.create(user: User.first, group: Group.first, group_standings: {1 => Team.find_by(country: "France").id, 2 => Team.find_by(country: "Canada").id, 3 => Team.find_by(country: "Colombia").id, 4 => Team.find_by(country: "New Zealand").id})
GroupPick.create(user: User.first, group: Group.second, group_standings: {1 => Team.find_by(country: "Germany").id, 2 => Team.find_by(country: "United States").id, 3 => Team.find_by(country: "Australia").id, 4 => Team.find_by(country: "Zambia").id})
GroupPick.create(user: User.first, group: Group.last, group_standings: {1 => Team.find_by(country: "Spain").id, 2 => Team.find_by(country: "Brazil").id, 3 => Team.find_by(country: "Japan").id, 4 => Team.find_by(country: "Nigeria").id})
