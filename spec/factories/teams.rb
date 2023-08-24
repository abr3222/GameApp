FactoryBot.define do
  factory :team do
    name { Faker::Sports::Football.team }
    city { Faker::Address.city }
    country { Faker::Address.country }
    # stadium_name { Faker::Sports::Football.stadium }
    stadium_name { "#{Faker::Address.city} Stadium" }
  end
end