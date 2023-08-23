FactoryBot.define do
  factory :match do
    date { "2023-08-21" }
    location { "MyString" }
    team_home_id { 1 }
    team_away_id { 1 }
    score_home { 1 }
    score_away { 1 }
    winner_team_id { 1 }
  end
end
