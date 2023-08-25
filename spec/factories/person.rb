# FactoryBot.use_parent_strategy = false
FactoryBot.define do
  factory :person do
    name { Faker::Name.name }
    email { Faker::Internet.unique.email }
    gender { Faker::Gender.binary_type }
  end

  # # Nested Factory : would be used for creating managers
  # factory :manager do
  #   managing_since { 5.years.ago }
  #   staff_count { 20 }
  #   leadership_style { "Democratic" }
  #   strategic_plans { "Improve productivity by 20% in the next year." }
  # end
  #
  # # This nested factory would be used for creating trainers
  # factory :trainer do
  #   training_approach { "Hands-on" }
  #   specialization { "Physical fitness" }
  #   experience { 3 }
  #   certifications { "ACE Certified Personal Trainer" }
  # end
  #
  # # This nested factory would be used for creating players
  # factory :player do
  #   shirt_number { rand(1..99) }
  #   injury_status { [true, false].sample }
  #   # And other attributes specific to players
  # end
  #
  # # This nested factory would be used for creating brand ambassadors
  # factory :brand_ambassador do
  #   social_media_presence { "Instagram, Twitter" }
  #   no_of_followers { 10000 }
  #   # And other attributes specific to brand ambassadors
  # end
end