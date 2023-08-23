class Match < ApplicationRecord
  # Attributes:
  # date, location, team_home_id, team_away_id, score_home, score_away, winner_team_id

  # validates :name, presence: true
  validates :location, presence: true
  validates :date, presence: true


  belongs_to :home_team, class_name: 'Team', foreign_key: 'team_home_id'
  belongs_to :away_team, class_name: 'Team', foreign_key: 'team_away_id'
end
