require 'rails_helper'

RSpec.describe "StoreAdmin's Model", type: :model do
  let(:store_admin) do
    StoreAdmin.new(
      email: Faker::Internet.safe_email,
      password: Faker::Internet.password,
      role: 'store_admin'
    )
  end
  describe 'Associations' do
    it '1, should belongs_to store' do
      store_admin = StoreAdmin.reflect_on_association(:store)
      expect(store_admin.macro).to eq(:belongs_to)
    end
  end

  describe 'Features' do
    describe 'view_store_transactions' do
      it '1, successfully view store transactions' do
        view_store_transactions_info = store_admin.view_store_transactions(store_id: 1)
        expect(view_store_transactions_info[:status]).to be == 200
      end
    end

    describe 'view_registered_store_customers' do
      it '1, successfully view registered store customers' do
        view_registered_store_customers_info = store_admin.view_registered_store_customers(store_id: -1)
        expect(view_registered_store_customers_info[:status]).to be == 400
      end
    end

    describe 'give_store_customer_discount' do
      it '1, invalid inputs shouldn\'t create personal discount' do
        view_registered_store_customers_info = store_admin
                                               .give_store_customer_discount(
                                                 personal_discount_info: { store_id: -1 }
                                               )
        expect(view_registered_store_customers_info[:status]).to (be == 400).or(be == 422)
      end
    end

    describe 'view_store_customer_food_orders' do
      it '1, invalid inputs shouldn\'t allow to view store customer food orders' do
        view_store_customer_food_orders_info = store_admin.view_store_customer_food_orders(store_customer_id: -5)
        expect(view_store_customer_food_orders_info[:status]).to (be == 400).or(be == 422)
      end
    end

    describe 'give_warning_store_customer' do
      it '1, if can\'t find store customerm dont give warning' do
        give_warning_store_customer_info = store_admin.give_warning_store_customer(store_customer_id: 1)
        expect(give_warning_store_customer_info[:status]).to (be == 400).or(be == 422)
      end
    end

    describe 'ban_store_customer' do
      it '1, invalid store customer id shouldn\'t ban store customer' do
        ban_store_customer_id = store_admin.ban_store_customer(store_customer_id: 1)
        expect(ban_store_customer_id[:status]).to (be == 400).or(be == 422)
      end
    end

    describe 'give_food_discount' do
      it '1, invalid  food id shouldn\'t give food a discount' do
        give_food_discount_id = store_admin.give_food_discount(food_id: 1, food_discount_percent: 50)
        expect(give_food_discount_id[:status]).to (be == 400).or(be == 422)
      end
    end

    describe 'add_new_food' do
      it '1, if required food info are not provided don\'t create new food' do
        add_new_food_info = store_admin.add_new_food(food_info: { name: Faker::Food.dish })
        expect(add_new_food_info[:status]).to (be == 400).or(be == 422)
      end
    end

    describe 'update_food' do
      it '1, if can\'t find food don\'t make an update' do
        update_food_info = store_admin.update_food(food_id: -1, food_info: { name: Faker::Food.dish })
        expect(update_food_info[:status]).to (be == 400).or(be == 422)
      end
    end

    describe 'update_food' do
      it '1, if can\'t find food don\'t shouldn\'t delete anything' do
        remove_food_info = store_admin.remove_food(food_id: -1)
        expect(remove_food_info[:status]).to (be == 400).or(be == 422)
      end
    end
  end
end
