require 'rails_helper'

RSpec.describe 'StoreCustomer/MarkFavoriteFood Controller', type: :request do
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

  describe 'Post' do
    describe 'store_customer/mark_favorite_food' do
      let(:mark_favorite_food_info) do
        JSON.parse(response.body)
      end
      before(:each) do
        post '/store_customer/mark_favorite_food', params: {
          mark_favorite_food_info: {
            secret_ingredient: 'secret_food'
          }
        }
      end

      it '1, if provided invalid food info raise an error' do
        expect(mark_favorite_food_info['status']).to (be == 422).or(be == 400)
      end
    end
  end
end
