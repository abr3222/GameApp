class CreateMatches < ActiveRecord::Migration[6.1]
  def change
    create_table :matches do |t|
      t.date :date
      t.string :location
      t.integer :team_home_id
      t.integer :team_away_id
      t.integer :score_home
      t.integer :score_away
      t.integer :winner_team_id

      t.timestamps
    end
  end
end
