require 'rails_helper'

RSpec.describe 'StoreCustomer/CreateStoreTransaction Controller', type: :request do
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

  describe 'Post' do
    describe 'store_customer/create_store_transaction' do
      let(:create_store_transaction_info) do
        JSON.parse(response.body)
      end
      before(:each) do
        post '/store_customer/create_store_transaction'
      end

      it '1, should successfully create store transaction' do
        expect(create_store_transaction_info['status']).to be == 200
      end
    end
  end
end
