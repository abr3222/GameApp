# db/seeds.rb

# Clean up old data
Team.destroy_all
Person.destroy_all
Match.destroy_all
Trainer.destroy_all
TrainingSession.destroy_all
Brand.destroy_all
Franchise.destroy_all

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

  # Create some Franchises
  Franchise.create(
    name: Faker::Company.name,
    description: Faker::Company.buzzword,
    team_id: team.id,
    brand_id: Brand.all.sample.id
  )
end

puts "Data seeded successfully!"
