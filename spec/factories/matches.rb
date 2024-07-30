FactoryBot.define do
  factory :match do
    association :team_a, factory: :team
    association :team_b, factory: :team
    group
    date { Time.now }
    team_a_goals { 0 }
    team_b_goals { 0 }
    team_a_yellow_cards { 0 }
    team_b_yellow_cards { 0 }
    team_a_red_cards { 0 }
    team_b_red_cards { 0 }
  end
end