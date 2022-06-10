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
  describe 'first_name' do
    it 'must be a String' do
      expect(store_customer.first_name).to be String
    end
    it 'must be not nil' do
      expect(store_customer.first_name).to_not be nil
    end
    it 'must be greater than 1 but less than 50' do
      expect(store_customer.first_name.length).to (be >= 5).and(be <= 50)
    end
  end
  describe 'last_name' do
    it 'must be a String' do
      expect(store_customer.last_name).to be String
    end
    it 'must be not nil' do
      expect(store_customer.last_name).to_not be nil
    end
    it 'must be greater than 1 but less than 50' do
      expect(store_customer.last_name.length).to (be >= 5).and(be <= 50)
    end
  end

  describe 'is_ban' do
    it 'must be a Boolean' do
      expect(store_customer.is_ban).to be_in([true, false])
    end
    it 'must be not nil' do
      expect(store_customer.is_ban).to_not be nil
    end
    it 'must be false upon creation' do
      expect(store_customer.is_ban).to be_falsy
    end
  end

  describe 'warning' do
    it 'must be a Integer' do
      expect(store_customer.warning).to be_a_kind_of(Integer)
    end
    it 'must be not nil' do
      expect(store_customer.warning).to_not be nil
    end
    it 'must be zero upon creation' do
      expect(store_customer.warning).to be_zero
    end
  end
end
