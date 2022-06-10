# frozen_string_literal: true

require 'rails_helper'

RSpec.describe "Store\'s Model", type: :model do
  let(:store) do
    Store.new(
      store_name: Faker::Company.name,
      address: Faker::Address.street_address
    )
  end

  describe 'Associations' do
    it '1, should have many store_customer' do
      store_customer = Store.reflect_on_association(:store_customers)
      expect(store_customer.macro).to eq(:has_many)


    end
  end

  describe 'Attributes' do
    describe 'store_name' do
      it '1, must be a string' do
        expect(store.store_name).to be_a String
      end
      it '2, must be not nil' do
        expect(store.store_name).to_not be_nil
      end
      it '3, must be greater than 0 and less than 65' do
        expect(store.store_name.length).to (be >= 1).and(be <= 64)
      end
    end

    describe 'address' do
      it '1, must be a string' do
        expect(store.address).to be_a String
      end
      it '2, must be not nil' do
        expect(store.address).to_not be_nil
      end
      it '3, must be greater than 0 and less than 129' do
        expect(store.address.length).to (be >= 1).and(be <= 128)
      end
    end
  end
end
