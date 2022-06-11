require 'rails_helper'

RSpec.describe StoreTransaction, type: :model do
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
  end

  describe 'Attributes' do
    describe 'status' do
      it 'must be a string' do
        expect(store_transaction.status).to be_a String
      end
      it 'must be not nil' do
        expect(store_transaction.status).to be_a String
      end
      it 'must be greater than or equal than 15' do
        expect(store_transaction.status.length).to be >= 15
      end
    end
  end
end
