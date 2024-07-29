class UserPick < ApplicationRecord
  belongs_to :user
  belongs_to :match
  belongs_to :predicted_winner, class_name: 'Team', foreign_key: 'predicted_winner_id'
end
