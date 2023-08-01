FactoryBot.define do
  factory :user do
    email                 {'test@example'}
    #password              {'000000'}
    password              {'1a' + Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    nickname              {Faker::Games::Pokemon.name}
    last_name             {'山田'}
    first_name            {'太郎'}
    last_name_kana        {'ヤマダ'}
    first_name_kana       {'タロウ'}
    birthday              {Faker::Date.birthday}
  end
end