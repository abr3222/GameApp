class Team < ApplicationRecord
  # Attributes:
  # name, city, country, stadium_name

  validates :name, presence: true
  validates :city, presence: true

  has_many :players

  has_one :manager
  has_many :training_sessions
  has_many :franchises
  has_many :brands, through: :franchises
  has_many :home_matches, class_name: 'Match', foreign_key: 'team_home_id'
  has_many :away_matches, class_name: 'Match', foreign_key: 'team_away_id'
end
