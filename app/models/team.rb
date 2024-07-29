class Team < ApplicationRecord
  belongs_to :group
  has_many :matches_as_team_a, class_name: 'Match', foreign_key: 'team_a_id'
  has_many :matches_as_team_b, class_name: 'Match', foreign_key: 'team_b_id'

  def matches
    Match.where("team_a_id = ? OR team_b_id = ?", self.id, self.id)
  end
end
