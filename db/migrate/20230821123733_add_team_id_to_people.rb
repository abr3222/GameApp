class AddTeamIdToPeople < ActiveRecord::Migration[6.1]
  def change
    add_reference :people, :team, null: true, foreign_key: true
  end
end
