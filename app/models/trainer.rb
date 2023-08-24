class Trainer < Person
  # Relations
  has_many :training_sessions, as: :trainable
  belongs_to :franchise, optional: true

  # Validations
  validates :training_approach, presence: true
end