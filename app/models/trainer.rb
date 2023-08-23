class Trainer < Person
  validates :training_approach, presence: true

  has_many :training_sessions, as: :trainable
  belongs_to :franchise, optional: true
end
