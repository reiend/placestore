# frozen_string_literal: true

require 'rails_helper'

RSpec.describe "FavoriteFood\'s Model", type: :model do
  let(:favorite_food) do
    FavoriteFood.new(
      name: Faker::Food.dish,
      price: Faker::Commerce.price,
      category: 'food',
      description: Faker::Food.description,
      is_available: Faker::Boolean.boolean(true_ratio: 0.5),
      like: Faker::Number.between(from: 1, to: 100)
    )
  end

  describe 'Associations' do
    it '1, should belongs_to store_customer' do
      favorite_food = FavoriteFood.reflect_on_association(:store_customer)
      expect(favorite_food.macro).to eq(:belongs_to)
    end
  end

  describe 'Attributes' do
    describe 'name' do
      it '1, must be a string' do
        expect(favorite_food.name).to be_a String
      end
      it '2, must be not nil' do
        expect(favorite_food.name).to_not be_nil
      end
      it '3, must be greater than 0 but less than 65' do
        expect(favorite_food.name.length).to (be >= 1).and(be <= 64)
      end
    end

    describe 'price' do
      it '1, must be a some type of Decimal' do
        expect(favorite_food.price.to_d).to be_a BigDecimal
      end
      it '2, must be not nil' do
        expect(favorite_food.price).to_not be_nil
      end
      it '3, must be greater than 0' do
        expect(favorite_food.name.length).to be >= 1
      end
    end

    describe 'category' do
      it '1, must be a string' do
        expect(favorite_food.category).to be_a String
      end
      it '2, must be not nil' do
        expect(favorite_food.category).to_not be_nil
      end
      it '3, must be greater than 0 but less than 65' do
        expect(favorite_food.category.length).to (be >= 1).and(be <= 64)
      end
    end

    describe 'description' do
      it '1, must be a string' do
        expect(favorite_food.description).to be_a String
      end
      it '2, must be greater or equal than 0 but less than 257' do
        expect(favorite_food.description.length).to (be >= 0).and(be <= 256)
      end
    end

    describe 'is_available' do
      it '1, must be a boolean' do
        expect(favorite_food.is_available).to be_in([true, false])
      end
      it '2, must be not nil' do
        expect(favorite_food.is_available).to_not be_nil
      end
    end

    describe 'like' do
      it '1, must be a Integer' do
        expect(favorite_food.like).to be_a_kind_of(Integer)
      end
      it '2, must be greater or equal than 0' do
        expect(favorite_food.like).to be >= 0
      end
    end
  end
end
