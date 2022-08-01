require 'rails_helper'

RSpec.describe 'StoreAdmin/UpdateFood Controller', type: :request do
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
    describe 'store_admin/update_food' do
      let(:update_food_info) do
        JSON.parse(response.body)
      end
      before(:each) do
        put '/store_admin/update_food', params: {
          food_info: {

          }
        }
      end

      it '1, invalid params info should raise an error' do
        expect(update_food_info['status']).to (be == 400).or(be == 422)
      end
    end
  end
end
