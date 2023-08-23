class Franchise < ApplicationRecord
  # Attributes:
  # name, description, team_id, brand_id
  validates :name, presence: true

  has_many :players, class_name: 'Player'

  belongs_to :team
  belongs_to :brand
end
