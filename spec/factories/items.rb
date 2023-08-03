FactoryBot.define do
  factory :item do
    association :user
    
    name                  {Faker::Games::Pokemon.name}
    price                 {Faker::Number.between(from: 300, to: 9999999)}
    info                  {Faker::Lorem.sentence}
    category_id           {Faker::Number.between(from: 2, to: 11)}
    status_id             {Faker::Number.between(from: 2, to: 7)}
    shipping_fee_id       {Faker::Number.between(from: 2, to: 3)}
    prefecture_id         {Faker::Number.between(from: 2, to: 48)}
    shipping_date_id      {Faker::Number.between(from: 2, to: 4)}

    after(:build) do |item|
      item.image.attach(io: File.open('public/testimg.jpg'), filename: 'testimg.jpg')
    end
  end
end