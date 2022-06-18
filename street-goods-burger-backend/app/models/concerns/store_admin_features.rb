# frozen_string_literal: true

# StoreAdminFeatures module

module StoreAdminFeatures
  def view_store_transactions
    store_transactions = StoreTransaction.all.map do |transaction|
      store_transaction_id = transaction[:id]

      # get store transaction corressponding cart
      cart_info = JSON.parse(Cart.where(store_transaction_id:).to_json)[0]
      cart_info_id = cart_info['id']

      # get food orders from that cart
      food_order_info = FoodOrder.all.where(cart_id: cart_info_id)

      {
        id: store_transaction_id,
        status: transaction[:status],
        created_at: transaction[:created_at],
        updated_at: transaction[:updated_at],
        cart_info: {
          id: cart_info_id,
          total_price: cart_info['total_price'],
          quantity: cart_info['quantity'],
          created_at: cart_info['created_at'],
          updated_at: cart_info['updated_at'],
          food_order_info:
        }
      }
    end
    {
      status: 200,
      message: 'successfully fetch store transactions',
      data: {
        store_transactions:
      }
    }
  end

  def view_registered_store_customers(store_id:)
    registered_customers = Store.find(store_id).store_customers.all.filter do |store_customer|
      store_customer if store_customer.confirmed?
    end

    {
      status: 200,
      message: 'successfully fetche registered store customer',
      data: {
        store_customers: registered_customers
      }
    }
  end
end
