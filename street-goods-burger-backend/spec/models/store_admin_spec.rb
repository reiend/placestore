require 'rails_helper'

RSpec.describe "StoreAdmin's Model", type: :model do
  let(:store_admin) do
    StoreAdmin.new(
      email: Faker::Internet.safe_email,
      password: Faker::Internet.password,
      role: 'store_admin'
    )
  end
  describe 'Associations' do
    it '1, should belongs_to store' do
      store_admin = StoreAdmin.reflect_on_association(:store)
      expect(store_admin.macro).to eq(:belongs_to)
    end
  end

  describe 'Features' do
    describe 'view_store_transactions' do
      it '1, successfully view store transactions' do
        view_store_transactions_info = store_admin.view_store_transactions(store_id: 1)
        expect(view_store_transactions_info[:status]).to be == 200
      end
    end

    describe 'view_registered_store_customers' do
      it '1, successfully view registered store customers' do
        view_registered_store_customers_info = store_admin.view_registered_store_customers(store_id: -1)
        expect(view_registered_store_customers_info[:status]).to be == 400
      end
    end

    describe 'give_store_customer_discount' do
      it '1, invalid inputs shouldn\'t create personal discount' do
        view_registered_store_customers_info = store_admin
                                               .give_store_customer_discount(
                                                 personal_discount_info: { store_id: -1 }
                                               )
        expect(view_registered_store_customers_info[:status]).to (be == 400).or(be == 422)
      end
    end

    describe 'view_store_customer_food_orders' do
      it '1, invalid inputs shouldn\'t allow to view store customer food orders' do
        view_store_customer_food_orders_info = store_admin.view_store_customer_food_orders(store_customer_id: -5)
        expect(view_store_customer_food_orders_info[:status]).to (be == 400).or(be == 422)
      end
    end
  end
end
