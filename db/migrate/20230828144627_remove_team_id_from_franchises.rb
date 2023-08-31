class RemoveTeamIdFromFranchises < ActiveRecord::Migration[6.1]
  def change
    remove_column :franchises, :team_id
  end
end
