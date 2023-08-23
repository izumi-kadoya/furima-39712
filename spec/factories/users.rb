FactoryBot.define do
  factory :user do
    nickname              { Faker::Name.initials(number: 2) }
    email                 { Faker::Internet.email }
    password              { Faker::Internet.password(min_length: 4) + '1' + 'a' }
    password_confirmation { password }
    lastname              { '石川' }
    firstname             { 'はなこ' }
    lastname_kana         { 'イシカワ' }
    firstname_kana        { 'ハナコ' }
    birthday              { Faker::Date.birthday }
  end
end
