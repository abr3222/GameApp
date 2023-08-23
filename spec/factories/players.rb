FactoryBot.define do
  factory :player do
    name { "John Doe" }
    email { "john@example.com" }
    gender { "male" }
    team
  end
end