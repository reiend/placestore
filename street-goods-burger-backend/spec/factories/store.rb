# fake store customer authentication
FactoryBot.define do
  factory :store do
    store_name { Faker::Company.name }
    address { Faker::Address.street_address }
  end
end
