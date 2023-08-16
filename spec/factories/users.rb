FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials(number: 2)}
    email                 {Faker::Internet.email}
    password              {Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    lastname              {Faker::Name.last_name}
    firstname             {Faker::Name.first_name}
    lastname_kana         {Faker::Name.last_name} 
    firstname_kana        {Faker::Name.first_name}
    birthday              {Faker::Date.birthday}
  end
end