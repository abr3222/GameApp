class Player < Person
  # Relations
  belongs_to :team
  belongs_to :brand, optional: true
  belongs_to :franchise, optional: true
end