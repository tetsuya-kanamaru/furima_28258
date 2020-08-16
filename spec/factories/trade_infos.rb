FactoryBot.define do
  factory :trade_info do
    postal_code       {'123-4567'}
    prefecture_id     {30}
    city              {'福岡市中央区'}
    house_number      {'笹丘3-27-7'}
    phone_number      {'09012345678'}

    association :user
    association :item
    
  end
end
