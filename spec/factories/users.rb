FactoryBot.define do
  factory :user do
    nickname {Faker::Name.last_name}
    email {Faker::Internet.free_email}
    password = Faker::Internet.password(min_length: 6)
    password {password}
    password_confirmation {password}
    first_name {Gimei.name.first.kanji}
    last_name {Gimei.name.last.kanji}
    first_name_read {Gimei.name.first.katakana}
    last_name_read {Gimei.name.last.katakana}
    birthday {Faker::Time.backward}
  end
end 