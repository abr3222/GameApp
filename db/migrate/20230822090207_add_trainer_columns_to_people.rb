class AddTrainerColumnsToPeople < ActiveRecord::Migration[6.1]
  def change
    add_column :people, :specialization, :string
    add_column :people, :experience, :string
    add_column :people, :certifications, :string
    add_column :people, :training_approach, :string
  end
end
