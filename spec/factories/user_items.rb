FactoryBot.define do
  factory :user_item do
    postal_code { '123-4567' }
    item_prefecture_id { 5 }
    city { '東京都' }
    addresses { '1-1' }
    building { '東京ビル' }
    phone_number { '09011112222' }
    token {"tok_abcdefghijk00000000000000000"}
  end
end

