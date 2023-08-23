FactoryBot.define do
  factory :person do
    name { "MyString" }
    date_of_birth { "2023-08-21" }
    address { "MyText" }
    phone_number { "MyString" }
    email { "MyString" }
    gender { "MyString" }
    contract_start_date { "2023-08-21" }
    contract_end_date { "2023-08-21" }
    type { "" }
  end
end
