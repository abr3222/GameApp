class CreateFranchises < ActiveRecord::Migration[6.1]
  def change
    create_table :franchises do |t|
      t.string :name
      t.text :description
      t.references :team, null: false, foreign_key: true
      t.references :brand, null: false, foreign_key: true

      t.timestamps
    end
  end
end
