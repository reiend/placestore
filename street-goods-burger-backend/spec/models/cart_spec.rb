require 'rails_helper'

RSpec.describe "Cart's Model", type: :model do
  let(:cart) do
    faker_quantity = Faker::Number.between(from: 1, to: 100)
    Cart.new(
      quantity: faker_quantity,
      total_price: faker_quantity * Faker::Commerce.price
    )
  end

  describe 'Associations' do
    it '1, should belongs_to store_transaction' do
      cart = Cart.reflect_on_association(:store_transaction)
      expect(cart.macro).to eq(:belongs_to)
    end
    it '2, should have many food_order' do
      cart = Cart.reflect_on_association(:food_orders)
      expect(cart.macro).to eq(:has_many)
    end
  end

  describe 'Attributes' do
    describe 'quantity' do
      it '1, must be a integer' do
        expect(cart.quantity).to be_a_kind_of(Integer)
      end

      it '2, must be not nil ' do
        expect(cart.quantity).to_not be_nil
      end

      it '3, must be greater than 0 ' do
        expect(cart.quantity).to be > 0
      end
    end

    describe 'total_price' do
      it '1, must be a Decimal' do
        expect(cart.total_price.to_d).to be_a BigDecimal
      end

      it '2, must be not nil ' do
        expect(cart.total_price).to_not be_nil
      end

      it '3, must be greater than 0 ' do
        expect(cart.total_price).to be > 0
      end
    end
  end
end
