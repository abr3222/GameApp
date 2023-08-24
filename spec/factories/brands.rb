FactoryBot.define do
  factory :brand do
    name { Faker::Company.name }
    description { Faker::Company.catch_phrase }
    parent_brand { nil }
  end
end