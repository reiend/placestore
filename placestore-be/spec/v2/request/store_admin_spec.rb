require 'rails_helper'

RSpec.describe 'StoreAdminController', type: :request do
  let(:store) do
    Store.create(
      name: 'store',
      line1: 'line1',
      line2: 'line2',
      postal_code: '4024',
      city: 'starosa',
      province: 'laguna'
    )
  end

  describe 'Get' do
    describe '/store_admin/stores' do
      before(:each) do
        @store_admin = FactoryBot.create :store_admin
      end
      it '1, should be successfully get stores ' do
        @store_admin.confirm
        sign_in @store_admin

        get '/store_admin/stores'

        expect(response).to have_http_status(200)
      end
    end

    describe '/store_admin/foods' do
      before(:each) do
        @store_admin = FactoryBot.create :store_admin
      end
      it '2, should be successfully get foods ' do
        @store_admin.confirm
        sign_in @store_admin

        get '/store_admin/foods'

        expect(response).to have_http_status(200)
      end
    end
  end
end
