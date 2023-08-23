class AddFranchiseToPeople < ActiveRecord::Migration[6.1]
  def change
    add_reference :people, :franchise, null: true, foreign_key: true
  end
end