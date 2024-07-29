class GroupPick < ApplicationRecord
  belongs_to :user
  belongs_to :group

  validates :group_standings, presence: true
  validate :validate_group_standings_format

  GROUP_STANDINGS_ERROR_MESSAGE = "must be a hash with numeric keys 1, 2, 3, 4 and integer values"

  def group_standings
    super&.transform_keys(&:to_i)
  end

  def group_standings=(value)
    super(value.transform_keys(&:to_i)) if value.is_a?(Hash)
  end

  private

  def validate_group_standings_format
    return unless group_standings.is_a?(Hash)

    expected_keys = [1, 2, 3, 4]
    transformed_keys = group_standings.keys.map(&:to_i)
    unless transformed_keys.sort == expected_keys && group_standings.values.all? { |v| v.is_a?(Integer) }
      errors.add(:group_standings, GROUP_STANDINGS_ERROR_MESSAGE)
    end
  end
end
