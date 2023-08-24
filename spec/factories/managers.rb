FactoryBot.define do
  factory :manager, parent: :person, class: 'Manager' do
    managing_since { Faker::Date.between(from: 10.years.ago, to: Date.today) }
    staff_count { Faker::Number.between(from: 5, to: 50) }
    leadership_style { Faker::Lorem.sentence }
    strategic_plans { Faker::Lorem.paragraph }
    association :team
  end
end