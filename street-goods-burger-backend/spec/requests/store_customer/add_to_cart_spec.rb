require 'rails_helper'

RSpec.describe 'StoreCustomer/AddToCart Controller', type: :request do
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
    describe 'store_customer/add_to_cart' do
      let(:add_to_cart_info) do
        JSON.parse(response.body)
      end
      before(:each) do
        post '/store_customer/add_to_cart', params: {
          add_to_cart_info: {
            store_transaction_id: -5,
            ordered_food: {
              food_name: Faker::Food.dish
            }
          }
        }
      end

      it '1, invalid add to cart info should raise an error' do
        expect(add_to_cart_info['status']).to (be == 422).or(be == 400)
      end
    end
  end
end
