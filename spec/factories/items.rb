FactoryBot.define do
  factory :item do

    name              {'デスク'}
    item_description  {'デスクです'}
    category_id       {3}
    item_condition_id {3}
    shipping_fee_id   {2}
    shipping_place_id {4}
    shipping_days_id  {2}
    price             {100000}

    association :user

  end
end