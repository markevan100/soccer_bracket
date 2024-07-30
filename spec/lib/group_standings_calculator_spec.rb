require 'rails_helper'

RSpec.describe GroupStandingsCalculator, type: :model do
  let(:group) { create(:group) }
  let!(:team_a) { create(:team, group: group) }
  let!(:team_b) { create(:team, group: group) }
  let!(:match_1) { create(:match, team_a: team_a, team_b: team_b, team_a_goals: 2, team_b_goals: 1, team_a_yellow_cards: 1, team_b_yellow_cards: 2, team_a_red_cards: 0, team_b_red_cards: 1) }
  let!(:match_2) { create(:match, team_a: team_b, team_b: team_a, team_a_goals: 1, team_b_goals: 1, team_a_yellow_cards: 1, team_b_yellow_cards: 1, team_a_red_cards: 0, team_b_red_cards: 0) }

  describe 'calculate_all' do
    it 'returns the correct standings for all groups' do
      result = GroupStandingsCalculator.calculate_all

      expect(result).to be_an(Array)
      expect(result.first[:group]).to eq(group)
      expect(result.first[:standings]).to be_an(Array)

      standings = result.first[:standings]
      expect(standings.length).to eq(2)

      team_a_standing = standings.find { |s| s[:team] == team_a }
      team_b_standing = standings.find { |s| s[:team] == team_b }

      expect(team_a_standing[:points]).to eq(4)
      expect(team_a_standing[:goals_for]).to eq(3)
      expect(team_a_standing[:goals_against]).to eq(2)
      expect(team_a_standing[:yellow_cards]).to eq(2)
      expect(team_a_standing[:red_cards]).to eq(0)

      expect(team_b_standing[:points]).to eq(1)
      expect(team_b_standing[:goals_for]).to eq(2)
      expect(team_b_standing[:goals_against]).to eq(3)
      expect(team_b_standing[:yellow_cards]).to eq(3)
      expect(team_b_standing[:red_cards]).to eq(1)
    end
  end
end