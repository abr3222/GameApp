class CreateTrainingSessions < ActiveRecord::Migration[6.1]
  def change
    create_table :training_sessions do |t|
      t.date :date
      t.string :title
      t.string :location
      t.string :training_focus
      t.string :training_goal
      t.references :team, null: false, foreign_key: true
      t.references :trainable, polymorphic: true, null: false

      t.timestamps
    end
  end
end
