require 'rails_helper'

RSpec.describe "FoodOrder's Model", type: :model do
  let(:food_order) do
    FoodOrder.new(
      food_name: Faker::Food.dish,
      food_category: 'food',
      price: Faker::Commerce.price,
      quantity: Faker::Number.between(from: 1, to: 100)
    )
  end

  describe 'Associations' do
    it '1, should belongs_to store_customer' do
      food_order = FoodOrder.reflect_on_association(:cart)
      expect(food_order.macro).to eq(:belongs_to)
    end
  end

  describe 'Attributes' do
    describe 'food_name' do
      it '1, must be a string' do
        expect(food_order.food_name).to be_a String
      end
      it '2, must be not nil' do
        expect(food_order.food_name).to_not be_nil
      end
      it '3, must be greater than 0 but less than 65' do
        expect(food_order.food_name.length).to (be >= 1).and(be <= 64)
      end
    end

    describe 'food_category' do
      it '1, must be a string' do
        expect(food_order.food_category).to be_a String
      end
      it '2, must be not nil' do
        expect(food_order.food_category).to_not be_nil
      end
      it '3, must be greater than 0 but less than 65' do
        expect(food_order.food_category.length).to (be >= 1).and(be <= 64)
      end
    end

    describe 'price' do
      it '1, must be a decimal' do
        expect(food_order.price).to be_a BigDecimal
      end
      it '2, must be not nil' do
        expect(food_order.price).to_not be_nil
      end
      it '3, must be greater than 0' do
        expect(food_order.price).to(be > 0)
      end
    end

    describe 'quantity' do
      it '1, must be a decimal' do
        expect(food_order.quantity).to be_a_kind_of(Integer)
      end
      it '2, must be not nil' do
        expect(food_order.quantity).to_not be_nil
      end
      it '3, must be greater than 0' do
        expect(food_order.quantity).to(be > 0)
      end
    end
  end
end
