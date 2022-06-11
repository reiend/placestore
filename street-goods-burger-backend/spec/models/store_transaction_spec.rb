require 'rails_helper'

RSpec.describe "StoreTransaction's Model", type: :model do
  let(:store_transaction) do
    StoreTransaction.new(
      status: 'process'
    )
  end

  describe 'Associations' do
    it '1, should belongs_to store_customer' do
      store_transaction = StoreTransaction.reflect_on_association(:store_customer)
      expect(store_transaction.macro).to eq(:belongs_to)
    end

    it '2, should have one cart' do
      store_transaction = StoreTransaction.reflect_on_association(:cart)
      expect(store_transaction.macro).to eq(:has_one)
    end
  end

  describe 'Attributes' do
    describe 'status' do
      it '1, must be a string' do
        expect(store_transaction.status).to be_a String
      end
      it '2, must be not nil' do
        expect(store_transaction.status).to be_a String
      end

      it '3, must be greater than 0 and less than 16  ' do
        expect(store_transaction.status.length).to (be >= 0).and(be <= 16)
      end
    end
  end
end
