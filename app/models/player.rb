class Player < Person
  validates :shirt_number, inclusion: { in: 1..99, message: "Shirt number should be between 1 and 99" }, allow_nil: true
  validates :injury_status, inclusion: { in: [true, false] }, allow_nil: false

  # Relations
  belongs_to :team
  belongs_to :brand, optional: true
  belongs_to :franchise, optional: true

  def fit_for_play?
    !injury_status
  end
end