class Manager < Person
  # Relations
  belongs_to :team
  has_many :training_sessions, as: :trainable
end