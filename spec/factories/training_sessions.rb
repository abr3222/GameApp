FactoryBot.define do
  factory :training_session do
    sequence(:title) { |n| "Training Session ##{n}" } # Applying Sequences
    date { Faker::Date.forward(days: 30) }
    location { Faker::Address.city }
    training_focus { Faker::Lorem.word }
    training_goal { Faker::Lorem.sentence }
    association :team
    trainable { create(:trainer) } # default to trainer, can be overridden in specs

    # Polymorphic associations can be handled with traits
    trait :for_manager do
      association :trainable, factory: :manager
    end

    trait :for_trainer do
      association :trainable, factory: :trainer
    end
  end
end