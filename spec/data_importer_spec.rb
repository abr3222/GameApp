# spec/services/data_importer_spec.rb

require 'rails_helper'

RSpec.describe DataImporter, type: :service do
  describe '.import' do
    let(:test_data) { YAML.load_file(Rails.root.join('config', 'data_import.yml')) }

    before do
      DataImporter.import
    end

    context 'brands and franchises' do
      it 'correctly imports brands' do
        expected_brands = test_data['brand_frenchises_data'].map { |brand_data| brand_data['brand_name'] }
        expect(Brand.pluck(:name)).to match_array(expected_brands)
      end

      it 'correctly imports franchises for each brand' do
        test_data['brand_frenchises_data'].each do |brand_data|
          brand = Brand.find_by(name: brand_data['brand_name'])
          expect(brand.franchises.pluck(:name)).to match_array(brand_data['frenchises'])
        end
      end
    end

    context 'teams and associations' do
      it 'correctly imports teams' do
        expected_teams = test_data['team_data'].flat_map { |city_data| city_data['teams'].map { |team| team['team_name'] } }
        expect(Team.pluck(:name)).to match_array(expected_teams)
      end

      it 'associates teams with the correct franchises' do
        test_data['team_data'].each do |city_data|
          city_data['teams'].each do |team_data|
            team = Team.find_by(name: team_data['team_name'])
            expected_franchises = team_data['frenchises']
            expect(team.franchises.pluck(:name)).to match_array(expected_franchises)
          end
        end
      end
    end
  end
end
