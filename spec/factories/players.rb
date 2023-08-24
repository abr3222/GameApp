FactoryBot.define do
  factory :player, parent: :person, class: 'Player' do
    shirt_number { Faker::Number.between(from: 1, to: 99) }
    injury_status { [true, false].sample }
    association :team
    association :brand
    association :franchise
  end
end