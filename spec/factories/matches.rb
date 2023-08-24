FactoryBot.define do
  factory :match do
    date { Faker::Date.forward(days: 30) }
    location { Faker::Address.city }
    association :home_team, factory: :team
    association :away_team, factory: :team
  end
end