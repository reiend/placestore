require 'rails_helper'

RSpec.describe 'StoreAdmin/ViewStoreTransactions Controller', type: :request do
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
    describe 'store_admin/view_store_transactions' do
      let(:view_store_transactions_info) do
        JSON.parse(response.body)['data']['store_transactions']
      end

      before(:each) do
        get '/store_admin/view_store_transactions'
      end
      it '1, success response' do
        expect(response).to have_http_status(:success)
      end

      it '2, store admin data json should not be nil' do
        expect(view_store_transactions_info).to_not be_nil
      end
    end
  end
end
