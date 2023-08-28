FactoryBot.define do
  factory :purchase_address do
    token { 'tok_abcdefghijk00000000000000000' }
    postcode { '123-4567' }
    prefecture_id { 2 }
    city { Faker::Address.city }
    street { Faker::Address.street_name }
    building { 'building123' }
    tel { Faker::Number.leading_zero_number(digits: [10, 11].sample) }
  end
end
