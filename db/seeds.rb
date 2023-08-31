# db/seeds.rb

# Clean up old data
# Team.destroy_all
# Person.destroy_all
# Match.destroy_all
# Trainer.destroy_all
# TrainingSession.destroy_all
# Brand.destroy_all
# Franchise.destroy_all
=begin
# Create some Brands with sub-brands
5.times do
  parent_brand = Brand.create(
    name: Faker::Company.name,
    description: Faker::Company.industry
  )

  # Create some sub-brands for each parent brand
  3.times do
    Brand.create(
      name: Faker::Company.name,
      description: Faker::Company.industry,
      parent_brand_id: parent_brand.id
    )
  end
end

# Create some Teams
5.times do
  team = Team.create(
    name: Faker::Sports::Football.team,
    city: Faker::Address.city,
    country: Faker::Address.country,
    stadium_name: "#{Faker::Name.unique.name} Stadium"
  )

  # Create Players, Managers, and BrandAmbassadors under Person using STI
  Player.create(
    name: Faker::Sports::Football.player,
    date_of_birth: Faker::Date.birthday(min_age: 18, max_age: 40),
    address: Faker::Address.full_address,
    phone_number: Faker::PhoneNumber.phone_number,
    email: Faker::Internet.email,
    gender: ["male", "female"].sample,
    team_id: team.id,
    shirt_number: rand(1..99),
    injury_status: [true, false].sample
  )

  m = Manager.create(
    name: Faker::Sports::Football.coach,
    date_of_birth: Faker::Date.birthday(min_age: 25, max_age: 65),
    address: Faker::Address.full_address,
    phone_number: Faker::PhoneNumber.phone_number,
    email: Faker::Internet.email,
    gender: ["male", "female"].sample,
    team_id: team.id
  )

  BrandAmbassador.create(
    name: Faker::Name.name,
    date_of_birth: Faker::Date.birthday(min_age: 20, max_age: 50),
    address: Faker::Address.full_address,
    phone_number: Faker::PhoneNumber.phone_number,
    email: Faker::Internet.email,
    gender: ["male", "female"].sample,
    brand_id: Brand.all.sample.id,
    social_media_presence: ["Facebook", "Twitter", "Instagram"].sample,
    no_of_followers: rand(1000..100000)
  )

  # Create some Matches
  Match.create(
    location: Faker::Address.city,
    team_home_id: team.id,
    team_away_id: (Team.pluck(:id) - [team.id]).sample,
    score_home: rand(0..5),
    score_away: rand(0..5)
  )

  # Create some Trainers
  trainer = Trainer.create(
    name: Faker::Name.name,
    email: Faker::Internet.email,
    gender: ["male", "female"].sample,
    specialization: Faker::Job.field,
    experience: rand(1..20),
    certifications: Faker::Job.education_level,
    training_approach: ["Online", "Offline"].sample
  )

  # Create TrainingSessions
  TrainingSession.create(
    date: Faker::Date.forward(days: 60),
    location: Faker::Address.city,
    training_focus: ["Strength", "Endurance", "Tactics"].sample,
    training_goal: Faker::Lorem.sentence(word_count: 3),
    team_id: team.id,
    trainable: [Manager.last, trainer].sample
  )
  #
  # # Create some Franchises
  # Franchise.create(
  #   name: Faker::Company.name,
  #   description: Faker::Company.buzzword,
  #   team_id: team.id,
  #   brand_id: Brand.all.sample.id
  # )
end
=end

#
# data = YAML.load_file(Rails.root.join('config', 'data_import.yml'))
#
# data['brand_frenchises_data'].each do |brand_data|
#   brand = Brand.find_or_create_by(name: brand_data['brand_name'])
#
#   brand_data['frenchises'].each do |franchise_name|
#     Franchise.find_or_create_by(name: franchise_name, brand: brand)
#   end
# end
#
# data['team_data'].each do |city_data|
#   city_data['teams'].each do |team_info|
#     team = Team.find_or_create_by(name: team_info['team_name'], city: city_data['city'])
#
#     team_info['frenchises'].each do |franchise_name|
#       franchise = Franchise.find_by(name: franchise_name)
#       FranchiseTeam.find_or_create_by(team: team, franchise: franchise) if franchise
#     end
#   end
# end

DataImporter.import

team_seeds = [
  { name: "Team_1", city: "Lahore", brand: "Vivo", franchises: ["Vivo French 1", "Vivo French 2"] },
  { name: "Team_2", city: "Lahore", brand: "Vivo", franchises: ["Vivo French 1"] },
  { name: "Team_3", city: "Lahore", brand: "Vivo", franchises: ["Vivo French 2"] },
  { name: "Team_4", city: "Lahore", brand: nil, franchises: [] },

  { name: "Team_5", city: "Lahore", brand: "TCL", franchises: ["TCL French 1", "TCL French 2"] },
  { name: "Team_6", city: "Lahore", brand: "TCL", franchises: ["TCL French 1", "TCL French 2"] },
  { name: "Team_7", city: "Lahore", brand: "TCL", franchises: ["TCL French 2"] },
  { name: "Team_8", city: "Lahore", brand: "TCL", franchises: ["TCL French 1"] },

  { name: "Team_9", city: "Lahore", brand: "Apple", franchises: ["Apple French"] },

  { name: "Team_10", city: "Karachi", brand: "TCL", franchises: ["TCL French 1", "TCL French 2"] },
  { name: "Team_11", city: "Karachi", brand: "TCL", franchises: ["TCL French 1"] },
  { name: "Team_12", city: "Karachi", brand: "Vivo", franchises: ["Vivo French 2"] },
  { name: "Team_13", city: "Karachi", brand: "Apple", franchises: ["Apple French"] },
  { name: "Team_14", city: "Karachi", brand: nil, franchises: [] },

  { name: "Team_15", city: "Fasilabad", brand: "TCL", franchises: ["TCL French 1"] },
  { name: "Team_16", city: "Fasilabad", brand: "Vivo", franchises: ["Vivo French 1"] },
  { name: "Team_17", city: "Fasilabad", brand: nil, franchises: [] }
]


# Method to compare a team record with a seed entry


discrepancies = []

team_seeds.each_with_index do |seed_entry, index|
  team = Team.find_by(name: seed_entry[:name])

  # Check if team exists
  unless team
    discrepancies << "Expected Team with name #{seed_entry[:name]} but none found"
    next
  end

  # Check city
  discrepancies << "Expected Team #{team.name} to have city #{seed_entry[:city]} but got #{team.city}" if team.city != seed_entry[:city]

  # Check brands
  if seed_entry[:brand]
    unless team.brands.pluck(:name).include?(seed_entry[:brand])
      discrepancies << "Expected Team #{team.name} to be associated with brand #{seed_entry[:brand]} but it wasn't"
    end
  else
    discrepancies << "Expected Team #{team.name} to not be associated with any brands but it was" unless team.brands.empty?
  end

  # Check franchises
  franchise_names = team.franchises.pluck(:name)
  seed_entry[:franchises].each do |franchise_name|
    discrepancies << "Expected Team #{team.name} to have franchise #{franchise_name} but none found" unless franchise_names.include?(franchise_name)
  end
end

if discrepancies.empty?
  puts "All data matches the seed data."
else
  puts discrepancies.join("\n")
end

puts "Data seeded successfully!"
