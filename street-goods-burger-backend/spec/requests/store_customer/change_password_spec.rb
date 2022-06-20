require 'rails_helper'

RSpec.describe 'StoreCustomer/ChangePassword Controller', type: :request do
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

  describe 'Put' do
    describe 'store_customer/change_password' do
      let(:change_password_info) do
        JSON.parse(response.body)
      end
      before(:each) do
        put '/store_customer/change_password', params: {
          change_password_info: {
            new_password: 'new_password123',
            new_password_confirmation: 'new_password12'
          }
        }
      end

      it '1, if password doesn\'t match raise an error' do
        expect(change_password_info['status']).to be == 422
      end
    end
  end
end
