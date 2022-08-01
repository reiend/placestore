require 'rails_helper'

RSpec.describe 'StoreCustomer/ProcessFoodOrder Controller', type: :request do
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
    describe 'store_customer/process_food_order' do
      let(:process_food_order_info) do
        JSON.parse(response.body)
      end
      before(:each) do
        put '/store_customer/process_food_order', params: {
          store_transaction_info: {

          }
        }
      end

      it '1, invalid request parameters should raise an error' do
        expect(process_food_order_info['status']).to (be == 422).or(be == 400)
      end
    end
  end
end
