class TrainingSession < ApplicationRecord
  # Attributes:
  # date, location, training_focus, training_goal, team_id, trainee_type

  belongs_to :team
  belongs_to :trainable, polymorphic: true
end