class Franchise < ApplicationRecord
  # Relations
  has_many :players, class_name: 'Player'
  belongs_to :brand
  has_many :franchise_teams
  has_many :teams, through: :franchise_teams

  # Validations
  validates :name, presence: true
end