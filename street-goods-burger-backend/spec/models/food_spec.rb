# frozen_string_literal: true

require 'rails_helper'

RSpec.describe "Food's Model", type: :model do
  let(:food) do
    Food.new(
      name: Faker::Food.dish,
      price: Faker::Commerce.price,
      category: 'food',
      description: Faker::Food.description,
      is_available: Faker::Boolean.boolean(true_ratio: 0.5),
      discount: Faker::Number.between(from: 1.00, to: 99.9).round(2),
      like: Faker::Number.between(from: 1, to: 100)
    )
  end

  describe 'Associations' do
    it '1, should belongs_to store' do
      food = Food.reflect_on_association(:store)
      expect(food.macro).to eq(:belongs_to)
    end
    it '3, should have many reviews' do
      food = Food.reflect_on_association(:reviews)
      expect(food.macro).to eq(:has_many)
    end
  end

  describe 'Attributes' do
    describe 'name' do
      it '1, must be a string' do
        expect(food.name).to be_a String
      end

      it '2, must be not nil' do
        expect(food.name).to_not be_nil
      end

      it '3, must be greater than 0 and less than 65' do
        expect(food.name.length).to (be >= 1).and(be <= 64)
      end
    end

    describe 'category' do
      it '1, must be a String' do
        expect(food.category).to be_a String
      end

      it '2, must be not nil' do
        expect(food.category).to_not be_nil
      end

      it '3, must be greater than 0 and less than 65' do
        expect(food.category.length).to (be >= 1).and(be <= 54)
      end
    end

    describe 'description' do
      it '1, must be a String' do
        expect(food.description).to be_a String
      end

      it '2, must be greater or equal than 0 and less than 257' do
        expect(food.description.length).to (be >= 0).and(be <= 256)
      end
    end

    describe 'price' do
      it '1, must be a decimal' do
        expect(food.price.to_d).to be_a BigDecimal
      end

      it '2, must be not nil' do
        expect(food.price).to_not be_nil
      end

      it '3, must be greater than 0' do
        expect(food.price).to(be > 0)
      end
    end

    describe 'is_available' do
      it '1, must be a boolean' do
        expect(food.is_available).to be_in([true, false])
      end

      it '2, must be not nil' do
        expect(food.is_available).to_not be_nil
      end
    end

    describe 'discount' do
      it '1, must be a boolean' do
        expect(food.discount.to_d).to be_a BigDecimal
      end

      it '2, must be greater than 0' do
        expect(food.discount).to(be > 0.00)
      end
    end

    describe 'like' do
      it '1, must be a integer' do
        expect(food.like).to be_a_kind_of(Integer)
      end

      it '2, must be greater or equal than 0' do
        expect(food.like).to be >= 0
      end
    end
  end
end
