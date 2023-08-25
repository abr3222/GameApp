class Manager < Person
  # Relations
  belongs_to :team
  has_many :training_sessions, as: :trainable

  # Validations
  validates :managing_since, presence: true
  validates :staff_count, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 5, less_than_or_equal_to: 50 }
  validates :leadership_style, presence: true, length: { maximum: 255 }
  validates :strategic_plans, presence: true

end