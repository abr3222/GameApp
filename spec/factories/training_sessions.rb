FactoryBot.define do
  factory :training_session do
    date { Faker::Date.forward(days: 30) }
    location { Faker::Address.city }
    training_focus { Faker::Lorem.word }
    training_goal { Faker::Lorem.sentence }
    association :team
    trainable { create(:trainer) } # default to trainer, can be overridden in specs
  end
end