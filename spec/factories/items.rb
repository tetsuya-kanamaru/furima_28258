FactoryBot.define do
  factory :item do

    name              {Faker::Lorem.words}
    item_description  {Faker::Lorem.sentence}
    category_id       {Faker::Number.within(range: 1..10)}
    item_condition_id {Faker::Number.within(range: 1..6)}
    shipping_fee_id   {Faker::Number.within(range: 1..2)}
    shipping_place_id {Faker::Number.within(range: 1..47)}
    shipping_days_id  {Faker::Number.within(range: 1..3)}
    price             {Faker::Number.within(range: 300..9999999)}

    association :user

  end
end