require 'rails_helper'

RSpec.describe Store, type: :model do
  let(:store) do
    Store.new(
      store_name: Faker::Name.first_name,
      address: Faker::Name.last_name
    )
  end

  describe 'store_name' do
    it 'must be a string' do
      expect(store.store_name).to be String
    end
    it 'must be not nil' do
      expect(store.store_name).to_not be_nil
    end
    it 'must be greater than 1 and less than 128' do
      expect(store.store_name).to (be >= 1).and(be <= 64)
    end
  end

  describe 'address' do
    it 'must be a string' do
      expect(store.address).to be String
    end
    it 'must be not nil' do
      expect(store.address).to_not be_nil
    end
    it 'must be greater than 1 and less than 128' do
      expect(store.address).to (be >= 1).and(be <= 128)
    end
  end
end
