class Group < ApplicationRecord
  has_many :teams
  has_many :matches
  has_many :group_picks

  validates :name, presence: true
end
