class CreateFranchiseTeams < ActiveRecord::Migration[6.1]
  def change
    create_table :franchise_teams do |t|
      t.references :team, null: false, foreign_key: true
      t.references :franchise, null: false, foreign_key: true

      t.timestamps
    end
  end
end
