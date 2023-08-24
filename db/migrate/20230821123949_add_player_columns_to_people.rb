class AddPlayerColumnsToPeople < ActiveRecord::Migration[6.1]
  def change
    change_table :people do |t|
      t.integer :shirt_number
      t.boolean :injury_status, default: false
    end
  end
end