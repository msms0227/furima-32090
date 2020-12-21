FactoryBot.define do
  factory :user_buy_record do
    postal_code    { '123-4567' }
    area_id        { 2 }
    city           { Faker::Internet.username }
    address        { Faker::Internet.username }
    building_name  { Faker::Internet.username }
    phone_number   { '12345678901' }
    token          { 'fhuhjdjdschurfuh' }
  end
end
