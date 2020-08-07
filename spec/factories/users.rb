FactoryBot.define do
  factory :user do

    nickname              {Faker::Name.name}
    email                 {Faker::Internet.free_email}
    password              {Faker::Internet.password(min_length: 6)}
    family_name           {'佐藤'}
    given_name            {'太郎'}
    family_name_reading   {'サトウ'}
    given_name_reading    {'タロウ'}
    birthday              {Faker::Date.between(from: '1930-01-01', to: '2015-12-31')}


  end
end

