require 'rails_helper'

RSpec.describe 'FoodController', type: :request do
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

  describe 'Post' do
    before(:each) do
      @store_admin = FactoryBot.create :store_admin
    end
    it '1, if food params is invalid, food shouldn\'t be created' do
      @store_admin.confirm
      sign_in @store_admin

      post '/food'

      expect(JSON.parse(response.body)['status']['code']).to (be == 400).or(be == 422)
      expect(JSON.parse(response.body)['data']).to be_nil
    end
    it '2, if store admin not signin raise unauthorized' do
      post '/food'

      expect(response).to have_http_status(401)
    end
  end

  describe 'Put' do
    before(:each) do
      @store_admin = FactoryBot.create :store_admin
    end
    it '1, if food params is invalid, food shouldn\'t be updated ' do
      @store_admin.confirm
      sign_in @store_admin

      put '/food'

      expect(JSON.parse(response.body)['status']['code']).to (be == 400).or(be == 422)
      expect(JSON.parse(response.body)['data']).to be_nil
    end
    it '2, if store admin not signin raise unauthorized' do
      post '/food'

      expect(response).to have_http_status(401)
    end
  end

  describe 'Delete' do
    before(:each) do
      @store_admin = FactoryBot.create :store_admin
    end
    it '1, if food params is invalid, food shouldn\'t be deleted' do
      @store_admin.confirm
      sign_in @store_admin
      delete '/food'

      expect(JSON.parse(response.body)['status']['code']).to (be == 400).or(be == 422)
      expect(JSON.parse(response.body)['data']).to be_nil
    end
    it '2, if store admin not signin raise unauthorized' do
      delete '/food'

      expect(response).to have_http_status(401)
    end
  end
end
