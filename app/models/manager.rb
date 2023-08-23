class Manager < Person
  # Attributes:
  # managing_since, staff_count, leadership_style, strategic_plans

  belongs_to :team
  has_many :training_sessions, as: :trainable
end
