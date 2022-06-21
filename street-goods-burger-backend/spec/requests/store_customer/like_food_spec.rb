require 'rails_helper'

RSpec.describe 'StoreCustomer/LikeFood Controller', type: :request do
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
    describe 'store_customer/like_food' do
      let(:like_food_info) do
        JSON.parse(response.body)
      end
      before(:each) do
        put '/store_customer/like_food', params: {
          food_info: {

          }
        }
      end

      it '1, invalid request params should raise an error' do
        expect(like_food_info['status']).to (be == 400).or(be == 422)
      end
    end
  end
end
