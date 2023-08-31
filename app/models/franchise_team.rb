class FranchiseTeam < ApplicationRecord
  belongs_to :team
  belongs_to :franchise

  validates :team_id, uniqueness: { scope: :franchise_id }
end
