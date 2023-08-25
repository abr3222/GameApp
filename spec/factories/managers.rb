FactoryBot.define do
  factory :manager, parent: :person, class: 'Manager' do # Assigning parent explicitly applying concept of Nested factories
    managing_since { Faker::Date.between(from: 10.years.ago, to: Date.today) }
    staff_count { Faker::Number.between(from: 5, to: 50) }
    leadership_style { Faker::Lorem.sentence }
    strategic_plans { Faker::Lorem.paragraph }
    team { association :team } # Applying Explicit definition concept
    # team { some_condition ? association(:away_team) : association(:home_team) }
  end
end