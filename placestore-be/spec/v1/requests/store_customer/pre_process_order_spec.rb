require 'rails_helper'

RSpec.describe 'StoreCustomer/PreProcessOrder Controller', type: :request do
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

  describe 'Get' do
    describe 'store_customer/pre_process_order' do
      let(:pre_process_order_info) do
        JSON.parse(response.body)['data']
      end

      before(:each) do
        get '/store_customer/pre_process_orders'
      end
      it '1, success response' do
        expect(response).to have_http_status(:success)
      end

      it '2, store customer data json should not be nil' do
        expect(pre_process_order_info).to_not be_nil
      end
    end
  end
end
