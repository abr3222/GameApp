class AddTrainerColumnsToPeople < ActiveRecord::Migration[6.1]
  def change
    change_table :people do |t|
      t.string :specialization
      t.string :experience
      t.string :certifications
      t.string :training_approach
    end
  end
end
