FactoryBot.define do
  factory :store_admin do
    email { Faker::Internet.safe_email }
    password { Faker::Internet.password }
  end
end
