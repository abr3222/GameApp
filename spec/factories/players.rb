FactoryBot.define do
  # factory :player, parent: :people, class: 'Player' do
  factory :player do
    shirt_number { Faker::Number.between(from: 1, to: 99) }
    injury_status { [true, false].sample }
    association :team
    association :brand
    association :franchise
  end
end