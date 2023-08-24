
class TrainingSession < ApplicationRecord
  # Relations
  belongs_to :team
  belongs_to :trainable, polymorphic: true
end