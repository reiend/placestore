require 'rails_helper'

RSpec.describe Store, type: :model do
  let(:store) do
    Store.new(
      store_name: Faker::Company.name,
      address: Faker::Address.street_address
    )
  end

  describe 'store_name' do
    it 'must be a string' do
      expect(store.store_name).to be_a String
    end
    it 'must be not nil' do
      expect(store.store_name).to_not be_nil
    end
    it 'must be greater than 1 and less than 128' do
      expect(store.store_name.length).to (be >= 1).and(be <= 64)
    end
  end

  describe 'address' do
    it 'must be a string' do
      expect(store.address).to be_a String
    end
    it 'must be not nil' do
      expect(store.address).to_not be_nil
    end
    it 'must be greater than 1 and less than 128' do
      expect(store.address.length).to (be >= 1).and(be <= 128)
    end
  end
end
