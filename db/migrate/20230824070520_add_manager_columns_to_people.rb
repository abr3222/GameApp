class AddManagerColumnsToPeople < ActiveRecord::Migration[6.1]
  def change
    change_table :people do |t|
      t.date :managing_since
      t.integer :staff_count
      t.text :leadership_style
      t.text :strategic_plans
    end
  end
end
