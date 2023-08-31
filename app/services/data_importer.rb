class DataImporter
  class << self
    def import
      brand_frenchises_data = load_data('brand_frenchises_data')
      import_brands_and_frenchises(brand_frenchises_data)

      team_data = load_data('team_data')
      import_teams_and_associations(team_data)
    end

    private

    def load_data(key)
      YAML.load_file(Rails.root.join('config', 'data_import.yml'))[key]
    end

    def import_brands_and_frenchises(data)
      data.each do |brand_data|
        brand = Brand.find_or_create_by(name: brand_data['brand_name'])
        brand_data['frenchises'].each do |franchise_name|
          Franchise.find_or_create_by(name: franchise_name, brand: brand)
        end
      end
    end

    def import_teams_and_associations(data)
      data.each do |city_data|
        city_data['teams'].each do |team_info|
          team = Team.find_or_create_by(name: team_info['team_name'], city: city_data['city'])
          associate_team_with_frenchises(team, team_info['frenchises'])
        end
      end
    end

    def associate_team_with_frenchises(team, frenchises)
      frenchises.each do |franchise_name|
        franchise = Franchise.find_by(name: franchise_name)
        FranchiseTeam.find_or_create_by(team: team, franchise: franchise) if franchise
      end
    end
  end
end
