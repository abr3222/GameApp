FactoryBot.define do
  factory :franchise do
    name { Faker::Company.name }
    description { Faker::Company.bs }
    association :team
    association :brand
  end
end