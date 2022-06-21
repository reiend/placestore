require 'rails_helper'

RSpec.describe 'StoreAdmin/GiveStoreCustomerDiscount Controller', type: :request do
  before(:each) do
    @store = FactoryBot.create :store
    @store_admin = @store.store_admins.create!(
      email: Faker::Internet.safe_email,
      password: Faker::Internet.password
    )

    @store_admin.confirm

    sign_in @store_admin
  end

  describe 'Post' do
    describe 'store_admin/give_store_customer_discount' do
      let(:give_store_customer_discount_info) do
        JSON.parse(response.body)
      end
      before(:each) do
        post '/store_admin/give_store_customer_discount', params: {
          personal_discount_info: {
            food_name: 'burger',
            food_category: 'food'
          }
        }
      end

      it '1, invalid store customer discount info should raise an error' do
        expect(give_store_customer_discount_info['status']).to (be == 400).or(be == 422)
      end
    end
  end
end
