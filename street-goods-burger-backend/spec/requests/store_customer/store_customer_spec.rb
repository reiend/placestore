require 'rails_helper'

RSpec.describe 'StoreCustomer Request', type: :request do
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
    describe 'store_customer/info' do
      let(:current_store_customer_info) do
        JSON.parse(response.body)['data']['store_customer']
      end
      before(:each) do
        get '/store_customer/info'
      end
      it '1, success response' do
        expect(response).to have_http_status(:success)
      end

      it '2, store customer data json should not be nil' do
        expect(current_store_customer_info).to_not be_nil
      end

      it '3, store customer data json should include the following data' do
        id = current_store_customer_info['id']
        email = current_store_customer_info['email']
        first_name = current_store_customer_info['last_name']
        last_name = current_store_customer_info['last_name']
        role = current_store_customer_info['warning']
        is_ban = current_store_customer_info['is_ban']

        expect(id).to_not be_nil
        expect(email).to_not be_nil
        expect(first_name).to_not be_nil
        expect(last_name).to_not be_nil
        expect(role).to_not be_nil
        expect(is_ban).to_not be_nil
      end
    end
  end

end
