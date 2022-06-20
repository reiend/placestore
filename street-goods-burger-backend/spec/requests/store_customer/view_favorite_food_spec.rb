require 'rails_helper'

RSpec.describe 'StoreCustomer/ViewfavoriteFoods Controller', type: :request do
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
    describe 'store_customer/view_favorite_foods' do
      let(:view_favorite_foods_info) do
        JSON.parse(response.body)['data']['store_customer_reviews']
      end

      before(:each) do
        get '/store_customer/view_favorite_foods'
      end
      it '1, success response' do
        expect(response).to have_http_status(:success)
      end

      it '2, store customer data json should not be nil' do
        expect(view_favorite_foods_info).to_not be_nil
      end
    end
  end
end
