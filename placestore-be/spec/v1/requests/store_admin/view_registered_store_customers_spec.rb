require 'rails_helper'

RSpec.describe 'StoreAdmin/ViewRegisteredStoreCustomers Controller', type: :request do
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
    describe 'store_admin/view_registered_store_customers' do
      let(:view_registered_store_customers_info) do
        JSON.parse(response.body)['data']
      end

      before(:each) do
        get '/store_admin/view_registered_store_customers'
      end
      it '1, success response' do
        expect(response).to have_http_status(:success)
      end

      it '2, store admin data json should be nil if no registered customer created' do
        expect(view_registered_store_customers_info).to be_nil
      end
    end
  end
end
