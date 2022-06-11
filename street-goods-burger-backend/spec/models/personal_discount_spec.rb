# frozen_string_literal: true

require 'rails_helper'

RSpec.describe "PersonalDiscount's Model", type: :model do
  let(:personal_discount) do
    PersonalDiscount.new(
      valid_date: Faker::Time.between(
        from: DateTime.now + 24.hour, to: DateTime.now + 48.hour
      ),
      discount: Faker::Number.between(from: 1.00, to: 99.99).round(2),
      food_name: Faker::Food.dish,
      food_category: 'food'
    )
  end

  describe 'Associations' do
    it '1, should belongs_to store_customer' do
      personal_discount = PersonalDiscount.reflect_on_association(:store_customer)
      expect(personal_discount.macro).to eq(:belongs_to)
    end
  end

  describe 'Attributes' do
    describe 'valid_date' do
      it '1, must be a datetime' do
        expect(personal_discount.valid_date).to be_an_instance_of ActiveSupport::TimeWithZone
      end
      it '2, must be not nil' do
        expect(personal_discount.valid_date).to_not be_nil
      end
      it '3, must be greater than or equal the current time ' do
        expect(personal_discount.valid_date).to be > DateTime.now
      end
    end

    describe 'discount' do
      it '1, must be a bigint' do
        expect(personal_discount.discount.to_d).to be_a BigDecimal
      end
      it '2, must be greater than or equal than 0' do
        expect(personal_discount.discount).to be >= 0.00
      end
    end

    describe 'food_name' do
      it '1, must be a string' do
        expect(personal_discount.food_name).to be_a String
      end
      it '2, must be not nil' do
        expect(personal_discount.food_name).to_not be_nil
      end
      it '3, must be greater than 0 but less than 65' do
        expect(personal_discount.food_name.length).to (be >= 1).and(be <= 64)
      end
    end

    describe 'food_category' do
      it '1, must be a string' do
        expect(personal_discount.food_category).to be_a String
      end
      it '2, must be not nil' do
        expect(personal_discount.food_category).to_not be_nil
      end
      it '3, must be greater than 0 but less than 65' do
        expect(personal_discount.food_category.length).to (be >= 1).and(be <= 64)
      end
    end
  end
end
