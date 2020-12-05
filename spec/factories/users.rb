FactoryBot.define do
  factory :user do
    nickname              { Faker::Internet.username }
    email                 { Faker::Internet.free_email }
    password              { Faker::Internet.password }
    password_confirmation { password }
    last_name             { '山田' }
    first_name            { '太郎' }
    last_name_kana        { 'ヤマダ' }
    first_name_kana       { 'タロウ' }
    birthday              { '2000-03-03' }
  end
end
