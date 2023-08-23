FactoryBot.define do
  factory :training_session do
    date { "2023-08-21" }
    location { "MyString" }
    training_focus { "MyString" }
    training_goal { "MyString" }
    team { nil }
    trainable { nil }
  end
end
