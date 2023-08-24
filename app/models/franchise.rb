class Franchise < ApplicationRecord
  # Relations
  has_many :players, class_name: 'Player'
  belongs_to :team
  belongs_to :brand

  # Validations
  validates :name, presence: true
end