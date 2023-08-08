FactoryBot.define do
  factory :order_form do
    postal_code   {'123-4567'}
    prefecture_id {Faker::Number.between(from: 2, to: 48)}
    city          {'東京都'}
    house_number  {'1-1'}
    building      {'東京ハイツ'}
    phone_number  {'00012345678'}
    token         {'tok_0000000000000000000000000000'}
  end
end
