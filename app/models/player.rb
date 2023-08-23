class Player < Person
  # Attributes:
  # shirt_number, injury_status
  validates :name, presence: true

  belongs_to :team
  belongs_to :brand, optional: true

  belongs_to :franchise, optional: true
end
