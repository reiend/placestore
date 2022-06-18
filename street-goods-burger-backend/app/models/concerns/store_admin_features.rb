# frozen_string_literal: true

# StoreAdminFeatures module
module StoreAdminFeatures
  def view_store_transactions(store_id:)
    store_transactions = StoreTransaction.where(store_id:).map do |transaction|
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
  rescue ActiveRecord::RecordNotFound => e
    {
      status: 400,
      message: 'cannot find that store',
      error: e.message
    }
  end

  def view_registered_store_customers(store_id:)
    registered_customers = Store.find(store_id).store_customers.all.filter do |store_customer|
      store_customer if store_customer.confirmed?
    end

    {
      status: 200,
      message: 'successfully fetch registered store customer',
      data: {
        store_customers: registered_customers
      }
    }
  rescue ActiveRecord::RecordNotFound => e
    {
      status: 400,
      message: 'cannot find that store',
      error: e.message
    }
  end

  def give_store_customer_discount(personal_discount_info:)
    food_name = personal_discount_info[:food_name]
    food_category = personal_discount_info[:food_category]
    discount = personal_discount_info[:discount]
    valid_date = DateTime.now + personal_discount_info[:hour].hour
    store_customer_id = personal_discount_info[:store_customer_id]

    PersonalDiscount.create!(
      food_name:,
      food_category:,
      discount:,
      valid_date:,
      store_customer_id:
    )
  rescue ActiveRecord::RecordNotFound => e
    {
      status: 400,
      message: 'invalid data provided',
      error: e.message
    }
  rescue ActiveRecord::RecordInvalid => e
    {
      status: 422,
      message: 'invalid data provided',
      error: e.message
    }
  rescue NoMethodError => e
    {
      status: 422,
      message: "can't do calculations based on data provided",
      errors: e.message
    }
  end

  def view_store_customer_food_orders(store_customer_id:)
    food_orders = StoreCustomer.find(store_customer_id).store_transactions.all.map do |store_transaction|
      store_transaction.cart.food_orders
    end

    {
      status: 200,
      message: 'successfully fetch store customer food orders',
      data: {
        store_customer_id:,
        store_customer_email: StoreCustomer.find(store_customer_id)[:email],
        food_orders:
      }
    }
  rescue ActiveRecord::RecordNotFound => e
    {
      status: 400,
      message: 'invalid data provided',
      error: e.message
    }
  rescue ActiveRecord::RecordInvalid => e
    {
      status: 422,
      message: 'invalid data provided',
      error: e.message
    }
  rescue NoMethodError => e
    {
      status: 422,
      message: "can't do calculations based on data provided",
      errors: e.message
    }
  end
end
