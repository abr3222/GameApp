class Match < ApplicationRecord
  # Relations
  belongs_to :home_team, class_name: 'Team', foreign_key: 'team_home_id'
  belongs_to :away_team, class_name: 'Team', foreign_key: 'team_away_id'

  # Validations
  # validates :name, presence: true (I assume you commented this for a reason)
  validates :location, presence: true
  validates :date, presence: true
end