FactoryBot.define do
  factory :user do
    name                  {Faker::Name.initials(number: 2)}
    email                 {Faker::Internet.free_email}
    password              {Faker::Lorem.characters(number: 6, min_alpha: 1, min_numeric: 1)}
    password_confirmation {password}
    last_name             {"野田"}
    first_name            {"大貴"}
    last_name_kana        {"ノダ"}
    first_name_kana       {"タイキ"}
    birth_day             {"2019-01-01"}
  end
end