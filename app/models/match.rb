class Match < ApplicationRecord
  belongs_to :group
  belongs_to :team_a, class_name: 'Team'
  belongs_to :team_b, class_name: 'Team'
  has_many :user_picks

  validates :team_a_goals, presence: true
  validates :team_b_goals, presence: true

  def winning_team
    return nil if team_a_goals == team_b_goals
    team_a_goals > team_b_goals ? team_a : team_b
  end
end
