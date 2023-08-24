class Team < ApplicationRecord
  # Relations
  has_many :players
  has_one :manager
  has_many :training_sessions
  has_many :franchises
  has_many :brands, through: :franchises
  has_many :home_matches, class_name: 'Match', foreign_key: 'team_home_id'
  has_many :away_matches, class_name: 'Match', foreign_key: 'team_away_id'

  # Validations
  validates :name, :city, presence: true

  # Scopes (for potential reuse and clearer queries)
  scope :with_players, -> { includes(:players) }
end