FactoryBot.define do
  factory :user do
    nickname              { Faker::Name.initials(number: 2) }
    email                 { Faker::Internet.free_email }
    password              { Faker::Internet.password(min_length: 6) }
    password_confirmation { password }
    birthday              { '1995-09-09' }
    first_name            { '太郎' }
    family_name           { '山田' }
    first_name_furigana   { 'タロウ' }
    family_name_furigana  { 'ヤマダ' }
  end
end
