FactoryBot.define do
  factory :brand_ambassador do
    name { "Jane Ambassador" }
    email { "jane@example.com" }
    gender { "female" } # Or any valid gender value
    social_media_presence { "Active" }
    no_of_followers { 1000 }
    team
    brand
  end
end