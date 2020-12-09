FactoryBot.define do
  factory :item do
    name                  { Faker::Internet.username }
    data                  { Faker::Internet.username }
    category_id           { 2 }
    status_id             { 2 }
    delivery_fee_id       { 2 }
    area_id               { 2 }
    days_id               { 2 }
    price                 { 10_000 }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/hero.jpg'), filename: 'hero.jpg')
    end
  end
end
