FactoryBot.define do
  factory :item do
    title         {Faker::Lorem.sentence, max_length: 40}
    detail        {Faker::Lorem.sentence,max_length: 1000}
    category_id   {2}
    condition_id  {2}
    fee_id        {2}
    prefecture_id {2}
    duration_id   {2}
    price         {Faker::Number.between(from: 300, to: 9999999) }
    association :user 

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
