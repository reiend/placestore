# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'StoreCustomer\'s Model', type: :model do
  let(:store_customer) do
    StoreCustomer.new(
      first_name: Faker::Name.first_name,
      last_name: Faker::Name.last_name,
      email: Faker::Internet.safe_email,
      password: Faker::Internet.password,
      role: 'store_customer'
    )
  end

  describe 'Associations' do
    it '1, should belongs_to store' do
      store_customer = StoreCustomer.reflect_on_association(:store)
      expect(store_customer.macro).to eq(:belongs_to)
    end

    it '2, should have many favorite_food' do
      store_customer = StoreCustomer.reflect_on_association(:favorite_foods)
      expect(store_customer.macro).to eq(:has_many)
    end

    it '3, should have many personal_discount' do
      store_customer = StoreCustomer.reflect_on_association(:personal_discounts)
      expect(store_customer.macro).to eq(:has_many)
    end

    it '4, should have many store_transasction' do
      store_customer = StoreCustomer.reflect_on_association(:store_transactions)
      expect(store_customer.macro).to eq(:has_many)
    end

    it '5, should have many review' do
      store_customer = StoreCustomer.reflect_on_association(:reviews)
      expect(store_customer.macro).to eq(:has_many)
    end
  end

  describe 'Features' do
    describe 'add_to_cart' do
      it "1, invalid inputs shouldn't add food to cart" do
        add_to_cart_info = store_customer.add_to_cart(store_transaction_id: -5, ordered_food: {})
        expect(add_to_cart_info[:status]).to be == 422
      end

      it '2, should raise an error if no food order adding to art' do
        expect do
          store_customer.add_to_cart(store_transaction_id: -5).to raise_error(ActiveRecord::ArgumentError)
        end
      end
    end

    describe 'mark_favorite_food' do
      it "1, invalid inputs shouldn't add to favorite food " do
        marked_favorite_food_info = store_customer
                                    .mark_favorite_food(
                                      food_info: {
                                        name: 'burger',
                                        price: 242.24,
                                        category: 'category',
                                        ingredients: 'secret',
                                        store_customer_id: store_customer[:id]
                                      }
                                    )
        expect(marked_favorite_food_info[:status]).to be == 422
      end
    end

    describe 'create_food_review' do
      it "1, invalid inputs shouldn't add to favorite food " do
        food_review_info = store_customer.create_food_review(food_review_info: { chef: 'unkwown' })
        expect(food_review_info[:status]).to (be == 400).or(be == 422)
      end
    end

    describe 'view_favorite_foods' do
      it '1, must be able to successfully view list of favorite food ' do
        view_favorite_foods_info = store_customer.view_favorite_foods
        expect(view_favorite_foods_info[:status]).to be == 200
      end
    end

    describe 'change_password' do
      it '1, password doens\'t match shouldn\'t change password' do
        change_password_info = store_customer
                               .change_password(
                                 password: {
                                   new_password: 'new_store_customer_password',
                                   new_password_confirmation: 'different_new_password'
                                 }

                               )
        expect(change_password_info[:status]).to be == 422
      end

      describe 'cancel_order' do
        it '1, store transaction must exist' do
          cancel_order_info = store_customer.cancel_order(store_transaction_id: -1)
          expect(cancel_order_info[:status]).to be == 422
        end
      end

      describe 'create_store_transaction' do
        it '1, successfully create store transaction' do
          create_store_transaction_info = store_customer.create_store_transaction
          expect(create_store_transaction_info[:status]).to be == 200
        end
      end
    end
  end

  describe 'Attributes' do
    describe 'first_name' do
      it '1, must be a String' do
        expect(store_customer.first_name).to be_a String
      end
      it '2, must be not nil' do
        expect(store_customer.first_name).to_not be nil
      end
      it '3, must be greater than 0 but less than 65' do
        expect(store_customer.first_name.length).to (be >= 1).and(be <= 64)
      end
    end
    describe 'last_name' do
      it '1, must be a String' do
        expect(store_customer.last_name).to be_a String
      end
      it '2, must be not nil' do
        expect(store_customer.last_name).to_not be nil
      end
      it '3, must be greater than 0 but less than 65' do
        expect(store_customer.last_name.length).to (be >= 1).and(be <= 64)
      end
    end

    describe 'is_ban' do
      it '1, must be a Boolean' do
        expect(store_customer.is_ban).to be_in([true, false])
      end
      it '2, must be not nil' do
        expect(store_customer.is_ban).to_not be nil
      end
      it '3, must be false upon creation' do
        expect(store_customer.is_ban).to be_falsy
      end
    end

    describe 'warning' do
      it '1, must be a Integer' do
        expect(store_customer.warning).to be_a_kind_of(Integer)
      end
      it '2, must be not nil' do
        expect(store_customer.warning).to_not be nil
      end
      it '3, must be zero upon creation' do
        expect(store_customer.warning).to be_zero
      end
    end
  end
end
