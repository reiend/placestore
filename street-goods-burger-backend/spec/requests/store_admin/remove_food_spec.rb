require 'rails_helper'

RSpec.describe 'StoreAdmin/RemoveFood Controller', type: :request do
  before(:each) do
    @store = FactoryBot.create :store
    @store_admin = @store.store_admins.create!(
      email: Faker::Internet.safe_email,
      password: Faker::Internet.password
    )

    @store_admin.confirm

    sign_in @store_admin
  end

  describe 'Put' do
    describe 'store_admin/remove_food' do
      let(:remove_food_info) do
        JSON.parse(response.body)
      end
      before(:each) do
        delete '/store_admin/remove_food', params: {
          food_info: {

          }
        }
      end

      it '1, invalid params info should raise an error' do
        expect(remove_food_info['status']).to (be == 400).or(be == 422)
      end
    end
  end
end
