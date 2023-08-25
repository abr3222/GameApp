FactoryBot.define do
  factory :brand do
    name { Faker::Company.name }
    description { Faker::Company.catch_phrase }
    parent_brand { nil }

    # factory :brand_with_sub_brand do
    transient do # Transient Attributes
      sub_brands_count { 0 } # By default, no sub-brands will be created.
    end

    after(:create) do |brand, evaluator| # use Transient Attributes With callbacks + Associations
      create_list(:brand, evaluator.sub_brands_count, parent_brand: brand)
    end
    # end
  end
end