FactoryBot.define do
  factory :trainer do
    name { "Trainer #{Faker::Name.name}" }
    training_approach { ["Practical", "Theoretical", "Mixed"].sample }
    specialization { Faker::Job.field }
    experience { rand(1..20) }  # assuming experience is in years
    certifications { Faker::Educator.course_name }

    # If you want to create a franchise alongside the trainer automatically, uncomment the below line
    # association :franchise
  end
end