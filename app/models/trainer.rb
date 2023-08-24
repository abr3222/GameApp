class Trainer < Person
  # Relations
  has_many :training_sessions, as: :trainable
  belongs_to :franchise, optional: true

  # Validations
  validates :training_approach, presence: true
  validates :specialization, presence: true
  validates :experience, presence: true, numericality: { only_integer: true, greater_than: 0 }
  validates :certifications, presence: true
end