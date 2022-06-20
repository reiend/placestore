require 'rails_helper'

RSpec.describe 'StoreCustomer/CreateFoodReview Controller', type: :request do
  before(:each) do
    @store = FactoryBot.create :store
    @store_customer = @store.store_customers.create!(
      first_name: Faker::Name.first_name,
      last_name: Faker::Name.last_name,
      email: Faker::Internet.safe_email,
      password: Faker::Internet.password
    )

    @store_customer.confirm

    sign_in @store_customer
  end

  describe 'Put' do
    describe 'store_customer/create_food_review' do
      let(:create_food_review_info) do
        JSON.parse(response.body)
      end
      before(:each) do
        post '/store_customer/create_food_review', params: {
          create_food_review_info: {
            food_review_info: {
              text_body: 'delicious',
              food_id: -5
            }
          }
        }
      end

      it '1, invalid create food review info should raise an error' do
        expect(create_food_review_info['status']).to (be == 422).or(be == 400)
      end
    end
  end
end
