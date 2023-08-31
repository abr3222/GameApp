class Team < ApplicationRecord
  # Relations
  has_many :players
  has_one :manager
  has_many :training_sessions
  has_many :franchise_teams
  has_many :franchises, through: :franchise_teams
  has_many :brands, through: :franchises
  has_many :home_matches, class_name: 'Match', foreign_key: 'team_home_id'
  has_many :away_matches, class_name: 'Match', foreign_key: 'team_away_id'

  # Validations
  validates :name, :city, presence: true

  # Return all city record if not match with brand name if brand name match then only return filtered record
  scope :city_or_brand, -> (city_name, brand_name) {
    matching_teams = left_outer_joins(franchises: :brand).where(city: city_name, brands: { name: brand_name }).distinct
    matching_teams.exists? ? matching_teams : where(city: city_name)
  }

  # Teams not linked with any brand
  scope :without_brand, -> {
    left_joins(franchises: :brand).where(brands: { id: nil }).distinct
  }

  # Search by city and/or brand name
  scope :by_city_and_brand, -> (city_name, brand_name = nil) {
    scope = where(city: city_name)
    if brand_name.present?
      scope = scope.joins(franchises: :brand).where(brands: { name: brand_name }).distinct
    end
    scope
  }

  # Search by city and/or franchise name
  scope :by_city_and_franchise, -> (city_name, franchise_name) {
    scope = where(city: city_name)
    if franchise_name.present?
      scope = scope.joins(:franchises).where(franchises: { name: franchise_name }).distinct
    end
    scope
  }

  # Search only by brand name
  scope :by_brand, -> (brand_name) {
    joins(franchises: :brand).where(brands: { name: brand_name }).distinct
  }

  # Search only by franchise name
  scope :by_franchise, -> (franchise_name) {
    joins(:franchises).where(franchises: { name: franchise_name }).distinct
  }


  # Cases for Scobe to Test
  #  mismatches = []
  #
  # # Test for Teams not linked with any brand
  # teams_without_brand = Team.without_brand
  # mismatches << "Mismatch in Teams without brand!" unless teams_without_brand.count == 3 && teams_without_brand.pluck(:name).sort == ["Team_17","Team_14","Team_4"].sort
  #
  # # Test for city_name + brand_name
  # teams_lahore = Team.by_city_and_brand("Lahore")
  # mismatches << "Mismatch in Teams for Lahore!" unless teams_lahore.count == 9
  #
  # teams_lahore_tcl = Team.by_city_and_brand("Lahore", "TCL")
  # mismatches << "Mismatch in Teams for Lahore TCL!" unless teams_lahore_tcl.count == 4
  #
  # teams_lahore_vivo = Team.by_city_and_brand("Lahore", "Vivo")
  # mismatches << "Mismatch in Teams for Lahore Vivo!" unless teams_lahore_vivo.count == 3
  #
  # teams_brand_tcl = Team.by_brand("TCL")
  # mismatches << "Mismatch in Teams for brand TCL!" unless teams_brand_tcl.count == 7
  #
  # teams_brand_vivo = Team.by_brand("Vivo")
  # mismatches << "Mismatch in Teams for brand Vivo!" unless teams_brand_vivo.count == 5
  #
  # # Test for city_name + franchise_name
  # teams_lahore_tcl_french1 = Team.by_city_and_franchise("Lahore", "TCL French 1")
  # mismatches << "Mismatch in Teams for Lahore TCL French 1!" unless teams_lahore_tcl_french1.count == 3
  #
  # teams_lahore_tcl_french2 = Team.by_city_and_franchise("Lahore", "TCL French 2")
  # mismatches << "Mismatch in Teams for Lahore TCL French 2!" unless teams_lahore_tcl_french2.count == 3
  #
  # teams_tcl_french2 = Team.by_franchise("TCL French 2")
  # mismatches << "Mismatch in Teams for TCL French 2!" unless teams_tcl_french2.count == 4
  #
  # teams_tcl_french1 = Team.by_franchise("TCL French 1")
  # mismatches << "Mismatch in Teams for TCL French 1!" unless teams_tcl_french1.count == 6
  #
  # # Test for brand_name and city
  # team_karachi_apple = Team.city_or_brand("Karachi", "Apple")
  # mismatches << "Mismatch in Teams for Karachi Apple!" unless team_karachi_apple.count == 1 && team_karachi_apple.pluck(:name).include?("Team_13")
  #
  # team_fasilabad_apple = Team.city_or_brand("Fasilabad", "Apple")
  # mismatches << "Mismatch in Teams for Fasilabad Apple!" unless team_fasilabad_apple.count == 3 && team_fasilabad_apple.pluck(:name).sort == ["Team_15", "Team_16","Team_17"].sort
  #
  # # Print all mismatches at once
  # puts mismatches.join("\n") unless mismatches.empty?
end