# spec/models/franchise_team_spec.rb

require 'rails_helper'

RSpec.describe FranchiseTeam, type: :model do
  let(:team) { create(:team) }
  let(:franchise) { create(:franchise) }
  subject { build(:franchise_team, team: team, franchise: franchise) }

  describe 'associations' do
    it { should belong_to(:team) }
    it { should belong_to(:franchise) }
  end

  describe 'validations' do
    it { should validate_uniqueness_of(:team_id).scoped_to(:franchise_id) }
  end

  describe 'functional tests' do
    context 'when creating a duplicate team-franchise combination' do
      before { create(:franchise_team, team: team, franchise: franchise) }

      it 'is not valid' do
        duplicate_franchise_team = build(:franchise_team, team: team, franchise: franchise)

        expect(duplicate_franchise_team).not_to be_valid
        expect(duplicate_franchise_team.errors.full_messages).to include("Team has already been taken")
      end
    end
  end
end
