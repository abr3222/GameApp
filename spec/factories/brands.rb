FactoryBot.define do
  factory :brand do
    name { "MyString" }
    description { "MyText" }
    parent_brand { nil }
  end
end
