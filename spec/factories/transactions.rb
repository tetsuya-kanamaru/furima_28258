FactoryBot.define do
  factory :transaction do

    postal_code         {'810-0034'}
    prefecture_id       {33}
    city                {'福岡市中央区'}
    house_number        {'笹丘3-27-7'}
    phone_number        {'09012345678'}

    association :user
    association :item

  end
end
