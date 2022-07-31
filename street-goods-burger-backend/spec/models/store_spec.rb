# frozen_string_literal: true

require 'rails_helper'

RSpec.describe "Store\'s Model", type: :model do
  let(:store) do
    Store.new(
      name: Faker::Company.name,
      line1: 'line1',
      line2: 'line2',
      postal_code: '6666',
      city: 'city1',
      province: 'province1'
    )
  end

  describe 'Associations' do
    it '1, should have many store_customer' do
      store = Store.reflect_on_association(:store_customers)
      expect(store.macro).to eq(:has_many)
    end

    it '2, should belongs to store_admin' do
      store = Store.reflect_on_association(:store_admin)
      expect(store.macro).to eq(:belongs_to)
    end

    it '3, should have many food' do
      store = Store.reflect_on_association(:foods)
      expect(store.macro).to eq(:has_many)
    end
  end

  describe 'Attributes' do
    describe 'store_name' do
      it '1, must be a string' do
        expect(store.name).to be_a String
      end
      it '2, must be not nil' do
        expect(store.name).to_not be_nil
      end
      it '3, must be greater than 0 and less than 65' do
        expect(store.name.length).to (be >= 1).and(be <= 64)
      end
    end

    describe 'line1' do
      it '1, must be a string' do
        expect(store.line1).to be_a String
      end
      it '2, must be not nil' do
        expect(store.line1).to_not be_nil
      end
      it '3, must be greater than 0 and less than 129' do
        expect(store.line1.length).to (be >= 1).and(be <= 128)
      end
    end

    describe 'line2' do
      it '1, must be a string' do
        expect(store.line2).to be_a String
      end
      it '2, must be not nil' do
        expect(store.line2).to_not be_nil
      end
      it '3, must be greater than 0 and less than 129' do
        expect(store.line2.length).to (be >= 1).and(be <= 128)
      end
    end

    describe 'postal_code' do
      it '1, must be a string' do
        expect(store.postal_code).to be_a String
      end
      it '2, must be not nil' do
        expect(store.postal_code).to_not be_nil
      end
      it '3, must be greater than 0 and less than 129' do
        expect(store.postal_code.length).to (be >= 1).and(be <= 128)
      end
    end

    describe 'city' do
      it '1, must be a string' do
        expect(store.city).to be_a String
      end
      it '2, must be not nil' do
        expect(store.city).to_not be_nil
      end
      it '3, must be greater than 0 and less than 129' do
        expect(store.city.length).to (be >= 1).and(be <= 128)
      end
    end

    describe 'province' do
      it '1, must be a string' do
        expect(store.province).to be_a String
      end
      it '2, must be not nil' do
        expect(store.province).to_not be_nil
      end
      it '3, must be greater than 0 and less than 129' do
        expect(store.province.length).to (be >= 1).and(be <= 128)
      end
    end
  end
end
