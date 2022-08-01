require 'rails_helper'

RSpec.describe 'StoreAdmin/ViewStoreCustomerFoodOrders Controller', type: :request do
  before(:each) do
    @store = FactoryBot.create :store
    @store_admin = @store.store_admins.create!(
      email: Faker::Internet.safe_email,
      password: Faker::Internet.password
    )

    @store_admin.confirm

    sign_in @store_admin
  end

  describe 'Get' do
    describe 'store_admin/view_store_customer_food_orders' do
      let(:view_store_customer_food_orders_info) do
        JSON.parse(response.body)
      end

      before(:each) do
        get '/store_admin/view_store_customer_food_orders', params: {
          data: {
            store_customer_id: -2
          }
        }
      end

      it '1, if can\'t find store customer id, raise an error' do
        expect(view_store_customer_food_orders_info['status']).to (be == 400).or(be == 422)
      end
    end
  end
end
