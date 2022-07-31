# fake store customer authentication
FactoryBot.define do
  factory :store do
    # store_name { Faker::Company.name }
    # address { Faker::Address.street_address }

    name do
      Faker::Company.name
    end
    line1 { 'line1' }
    line2 { 'line2' }
    postal_code { '6666' }
    city { 'city1' }
    province { 'province1' }
  end
end
