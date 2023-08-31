require 'rails_helper'

RSpec.describe Team, type: :model do
  # Validations
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:city) }

  # Relationships
  it { should have_many(:franchises) }
  it { should have_many(:players) }

  before { import_test_data }

  describe 'scopes' do
    subject { described_class }

    describe '.without_brand' do
      subject { described_class.without_brand }

      it_behaves_like 'returns expected teams count', 3
      it_behaves_like 'matches team names', ["Team_17", "Team_14", "Team_4"]
    end

    describe '.by_city_and_brand' do
      subject { described_class.by_city_and_brand(city, brand) }

      let(:city) { "Lahore" }

      context 'with no brand' do
        let(:brand) { nil }
        it_behaves_like 'returns expected teams count', 9
      end

      context 'with TCL brand' do
        let(:brand) { "TCL" }
        it_behaves_like 'returns expected teams count', 4
      end

      context 'with Vivo brand' do
        let(:brand) { "Vivo" }
        it_behaves_like 'returns expected teams count', 3
      end
    end

    describe '.by_brand' do
      subject { described_class.by_brand(brand) }

      context 'with TCL brand' do
        let(:brand) { "TCL" }
        it_behaves_like 'returns expected teams count', 7
      end

      context 'with Vivo brand' do
        let(:brand) { "Vivo" }
        it_behaves_like 'returns expected teams count', 5
      end
    end

    describe '.by_city_and_franchise' do
      subject { described_class.by_city_and_franchise(city, franchise) }
      let(:city) { "Lahore" }

      context 'with TCL French 1 franchise' do
        let(:franchise) { "TCL French 1" }
        it_behaves_like 'returns expected teams count', 3
      end

      context 'with TCL French 2 franchise' do
        let(:franchise) { "TCL French 2" }
        it_behaves_like 'returns expected teams count', 3
      end
    end

    describe '.by_franchise' do
      subject { described_class.by_franchise(franchise) }

      context 'with TCL French 2 franchise' do
        let(:franchise) { "TCL French 2" }
        it_behaves_like 'returns expected teams count', 4
      end

      context 'with TCL French 1 franchise' do
        let(:franchise) { "TCL French 1" }
        it_behaves_like 'returns expected teams count', 6
      end
    end

    describe '.city_or_brand' do
      subject { described_class.city_or_brand(city, brand) }

      context 'for Karachi with Apple brand' do
        let(:city) { "Karachi" }
        let(:brand) { "Apple" }

        it_behaves_like 'returns expected teams count', 1
        it_behaves_like 'matches team names', ["Team_13"]
      end

      context 'for Fasilabad with Apple brand' do
        let(:city) { "Fasilabad" }
        let(:brand) { "Apple" }

        it_behaves_like 'returns expected teams count', 3
        it_behaves_like 'matches team names', ["Team_15", "Team_16", "Team_17"]
      end
    end
  end
end

# First Approch
# require 'rails_helper'
# RSpec.describe Team, type: :model do
#
#   # Validations
#   it { should validate_presence_of(:name) }
#   it { should validate_presence_of(:city) }
#
#   # Relationships
#   it { should have_many(:franchises) }
#   it { should have_many(:players) } # Assuming the foreign key on `people` table is `team_id`.
#
#   before do
#     import_test_data
#   end
#
#   describe 'scopes' do
#
#     describe '.without_brand' do
#       it 'returns teams not linked with any brand' do
#         teams_without_brand = Team.without_brand
#         expect(teams_without_brand.count).to eq(3)
#         expect(teams_without_brand.pluck(:name)).to match_array(["Team_17", "Team_14", "Team_4"])
#       end
#     end
#
#     describe '.by_city_and_brand' do
#       it 'returns teams only for Lahore' do
#         teams = Team.by_city_and_brand("Lahore")
#         expect(teams.count).to eq(9)
#       end
#
#       it 'returns teams for Lahore with TCL brand' do
#         teams = Team.by_city_and_brand("Lahore", "TCL")
#         expect(teams.count).to eq(4)
#       end
#
#       it 'returns teams for Lahore with Vivo brand' do
#         teams = Team.by_city_and_brand("Lahore", "Vivo")
#         expect(teams.count).to eq(3)
#       end
#     end
#
#     describe '.by_brand' do
#       it 'returns teams for TCL brand' do
#         teams = Team.by_brand("TCL")
#         expect(teams.count).to eq(7)
#       end
#
#       it 'returns teams for Vivo brand' do
#         teams = Team.by_brand("Vivo")
#         expect(teams.count).to eq(5)
#       end
#     end
#
#     describe '.by_city_and_franchise' do
#       it 'returns teams for Lahore with TCL French 1 franchise' do
#         teams = Team.by_city_and_franchise("Lahore", "TCL French 1")
#         expect(teams.count).to eq(3)
#       end
#
#       it 'returns teams for Lahore with TCL French 2 franchise' do
#         teams = Team.by_city_and_franchise("Lahore", "TCL French 2")
#         expect(teams.count).to eq(3)
#       end
#     end
#
#     describe '.by_franchise' do
#       it 'returns teams for TCL French 2 franchise' do
#         teams = Team.by_franchise("TCL French 2")
#         expect(teams.count).to eq(4)
#       end
#
#       it 'returns teams for TCL French 1 franchise' do
#         teams = Team.by_franchise("TCL French 1")
#         expect(teams.count).to eq(6)
#       end
#     end
#
#     describe '.city_or_brand' do
#       it 'returns teams for Karachi with Apple brand' do
#         team_karachi_apple = Team.city_or_brand("Karachi", "Apple")
#         expect(team_karachi_apple.count).to eq(1)
#         expect(team_karachi_apple.pluck(:name)).to include("Team_13")
#       end
#
#       it 'returns teams for Fasilabad with Apple brand' do
#         team_fasilabad_apple = Team.city_or_brand("Fasilabad", "Apple")
#         expect(team_fasilabad_apple.count).to eq(3)
#         expect(team_fasilabad_apple.pluck(:name)).to match_array(["Team_15", "Team_16","Team_17"])
#       end
#     end
#
#   end
# end
