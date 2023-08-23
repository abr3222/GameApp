class AddPlayerColumnsToPeople < ActiveRecord::Migration[6.1]
  def change
    add_column :people, :shirt_number, :integer
    add_column :people, :injury_status, :boolean
  end
end
