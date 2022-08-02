require 'rails_helper'

RSpec.describe 'StoreController', type: :request do
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
    describe '/store/list' do
      before(:each) do
        @store_admin = FactoryBot.create :store_admin
      end
      it '1, should be successfully get stores ' do
        @store_admin.confirm
        sign_in @store_admin

        get '/store/list'

        expect(response).to have_http_status(200)
      end
    end

    describe '/store' do
      before(:each) do
        @store_admin = FactoryBot.create :store_admin
      end
      it '2, if store params is invalid, should raise an error ' do
        @store_admin.confirm
        sign_in @store_admin

        get '/store'

        expect(JSON.parse(response.body)['status']['code']).to (be == 400).or(be == 422)
      end
    end
  end

  describe 'Post' do
    describe '/store' do
      before(:each) do
        @store_admin = FactoryBot.create :store_admin
      end

      it '2, if store params is invalid for creating store, should raise an error ' do
        @store_admin.confirm
        sign_in @store_admin

        post '/store'

        expect(JSON.parse(response.body)['status']['code']).to (be == 400).or(be == 422)
      end
    end
  end
end
