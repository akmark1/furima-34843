FactoryBot.define do
  factory :item do
    name { "sample" }
    description { "sample" }
    value { 300 }
    association :user
    category_id { 2 }
    status_id { 2 }
    delivery_id { 2 }
    state_id { 2 }
    delivery_day_id { 2 }

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
