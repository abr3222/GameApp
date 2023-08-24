FactoryBot.define do
  factory :people do
    name { Faker::Name.name }
    email { Faker::Internet.unique.email }
    gender { Faker::Gender.binary_type }
  end
end