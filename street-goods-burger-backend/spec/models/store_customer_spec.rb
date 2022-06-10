# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'StoreCustomer\'s Model', type: :model do
  let(:store_customer) do
    StoreCustomer.new(
      first_name: Faker::Name.first_name,
      last_name: Faker::Name.last_name,
      email: Faker::Internet.safe_email,
      password: Faker::Internet.password,
      role: 'store_customer'
    )
  end

  describe 'associations' do
    it '1, should belongs_to store' do
      store = StoreCustomer.reflect_on_association(:store)
      expect(store.macro).to eq(:belongs_to)
    end

    it '2, should have many favorite_food' do
      favorite_food = StoreCustomer.reflect_on_association(:favorite_foods)
      expect(favorite_food.macro).to eq(:has_many)
    end
  end

  describe 'attributes' do
    describe 'first_name' do
      it '1, must be a String' do
        expect(store_customer.first_name).to be_a String
      end
      it '2, must be not nil' do
        expect(store_customer.first_name).to_not be nil
      end
      it '3, must be greater than 1 but less than 50' do
        expect(store_customer.first_name.length).to (be >= 1).and(be <= 50)
      end
    end
    describe 'last_name' do
      it '1, must be a String' do
        expect(store_customer.last_name).to be_a String
      end
      it '2, must be not nil' do
        expect(store_customer.last_name).to_not be nil
      end
      it '3, must be greater than 1 but less than 50' do
        expect(store_customer.last_name.length).to (be >= 1).and(be <= 50)
      end
    end

    describe 'is_ban' do
      it '1, must be a Boolean' do
        expect(store_customer.is_ban).to be_in([true, false])
      end
      it '2, must be not nil' do
        expect(store_customer.is_ban).to_not be nil
      end
      it '3, must be false upon creation' do
        expect(store_customer.is_ban).to be_falsy
      end
    end

    describe 'warning' do
      it '1, must be a Integer' do
        expect(store_customer.warning).to be_a_kind_of(Integer)
      end
      it '2, must be not nil' do
        expect(store_customer.warning).to_not be nil
      end
      it '3, must be zero upon creation' do
        expect(store_customer.warning).to be_zero
      end
    end
  end
end
