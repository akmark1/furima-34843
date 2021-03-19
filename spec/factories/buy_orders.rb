FactoryBot.define do
  factory :buy_order do
    zip_code { '123-4567' }
    state { 2 }
    city { '品川区' }
    house_number { '1-1' }
    room_number { '東京ハイツ' }
    phone_number { '08012345678' }
    token {"tok_abcdefghijk00000000000000000"}
  end
end
