FactoryBot.define do
  factory :trainer, parent: :person, class: 'Trainer' do
    training_approach { ["Practical", "Theoretical", "Mixed"].sample }
    specialization { Faker::Job.field }
    experience { rand(1..20) }  # assuming experience is in years
    certifications { Faker::Educator.course_name }

    association :franchise
  end
end