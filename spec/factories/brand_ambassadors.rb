FactoryBot.define do
  factory :brand_ambassador, parent: :person, class: 'BrandAmbassador' do
    social_media_presence { Faker::Internet.url }
    no_of_followers { Faker::Number.between(from: 1, to: 10000) }
    association :team # Applying Associations Explicit definition
    # association :brand
    brand # Applying Associations Implicit definition
  end
end