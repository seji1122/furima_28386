FactoryBot.define do
  factory :item do
    name {Faker::Lorem.sentence}
    introduction {Faker::Lorem.sentence}
    category_id {"3"}
    item_condition_id {"2"}
    delivery_fee_id {"2"}
    shipping_area_id {"10"}
    shipping_days_id {"2"}
    price {"1000"}
    association :user 

  end
end
