class GroupStandingsCalculator
  def self.calculate_all
    Group.all.map do |group|
      {
        group: group,
        standings: calculate_for_group(group)
      }
    end
  end

  private

  def self.calculate_for_group(group)
    standings = group.teams.map do |team|
      matches = team.matches
      points = calculate_points(team, matches)
      goals_for = calculate_goals_for(matches, team)
      goals_against = calculate_goals_against(matches, team)
      yellow_cards = calculate_yellow_cards(matches, team)
      red_cards = calculate_red_cards(matches, team)
      goal_difference = goals_for - goals_against

      {
        id: team.id,
        country: team.country,
        group_id: team.group_id,
        country_code: team.country_code,
        points: points,
        goals_for: goals_for,
        goals_against: goals_against,
        yellow_cards: yellow_cards,
        red_cards: red_cards,
        goal_difference: goal_difference
      }
    end

    standings.sort_by do |standing|
      [-standing[:points], -standing[:goal_difference], -standing[:goals_for]]
    end.tap do |sorted_standings|
      if standings.uniq { |s| [s[:points], s[:goal_difference], s[:goals_for]] }.size != standings.size
        raise 'Teams are still tied after goal differential and goals for!'
      end
    end
  end

  def self.calculate_points(team, matches)
    matches.reduce(0) do |points, match|
      if match.winning_team == team
        points + 3
      elsif match.winning_team.nil?
        points + 1
      else
        points
      end
    end
  end  

  def self.calculate_goals_for(matches, team)
    matches.sum do |match|
      match.team_a_id == team.id ? match.team_a_goals : match.team_b_goals
    end
  end

  def self.calculate_goals_against(matches, team)
    matches.sum do |match|
      match.team_a_id == team.id ? match.team_b_goals : match.team_a_goals
    end
  end

  def self.calculate_yellow_cards(matches, team)
    matches.sum do |match|
      match.team_a_id == team.id ? match.team_a_yellow_cards : match.team_b_yellow_cards
    end
  end

  def self.calculate_red_cards(matches, team)
    matches.sum do |match|
      match.team_a_id == team.id ? match.team_a_red_cards : match.team_b_red_cards
    end
  end
end
