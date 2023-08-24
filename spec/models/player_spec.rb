require 'rails_helper'

RSpec.describe Player, type: :model do
  let(:player) { build(:player) }

  it_behaves_like "person attributes"

  context "validations" do
    it { should validate_inclusion_of(:shirt_number).in_range(1..99).with_message("Shirt number should be between 1 and 99").allow_nil }
    # # it { should validate_inclusion_of(:injury_status).in_array([true, false]) }
    #
    # it 'does not allow non-boolean values for injury_status' do
    #   player = build(:player, injury_status: "some string")
    #   expect(player).not_to be_valid
    #   expect(player.errors.details[:injury_status][0][:error]).to eq(:inclusion)
    # end

    context 'player fitness' do
      it 'is not fit for play when injury_status is true' do
        unfit_player = create(:player, injury_status: true)
        expect(unfit_player.fit_for_play?).to be false
      end

      it 'is fit for play when injury_status is false' do
        fit_player = create(:player, injury_status: false)
        expect(fit_player.fit_for_play?).to be true
      end
    end
  end

  context "associations" do
    it { should belong_to(:team) }
    it { should belong_to(:brand).optional }
    it { should belong_to(:franchise).optional }
  end
end

