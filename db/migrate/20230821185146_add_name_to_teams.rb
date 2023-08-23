class AddNameToTeams < ActiveRecord::Migration[6.1]
  def change
    change_column_null :teams, :name, false
  end
end
