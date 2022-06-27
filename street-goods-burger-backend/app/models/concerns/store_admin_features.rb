# git push --set-upstream origin fix/feature/store_admin/view_store_transactions           frozen_string_literal: true

# StoreAdminFeatures module
module StoreAdminFeatures
  def view_store_transactions(store_id:)
    store_transactions = StoreTransaction.where(store_id:).map do |transaction|
      store_transaction_id = transaction[:id]
      transaction.cart

      if transaction.cart.nil?

        # get store transaction corressponding cart

        {
          id: store_transaction_id,
          status: transaction[:status],
          store_customer_email: transaction.store_customer[:email],
          created_at: transaction[:created_at],
          updated_at: transaction[:updated_at],
          cart_info: {
            message: 'no cart yet'
          }
        }

      else
        # get store transaction corressponding cart
        cart_info = transaction.cart
        cart_info_id = cart_info[:id]

        {
          id: store_transaction_id,
          status: transaction[:status],
          store_customer_email: transaction.store_customer[:email],
          created_at: transaction[:created_at],
          updated_at: transaction[:updated_at],
          cart_info: {
            id: cart_info_id,
            total_price: cart_info['total_price'],
            quantity: cart_info['quantity']
          }
        }
      end
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

    store_customer_discount_info = PersonalDiscount.create!(
      food_name:,
      food_category:,
      discount:,
      valid_date:,
      store_customer_id:
    )

    {
      status: 200,
      successfully: "successfully given #{store.store_customers.find(store_customer_id)[:email]} a discount",
      data: {
        store_customer_discount_info:,
        is_valid: DateTime.now < valid_date
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

  def view_store_customer_food_orders(store_customer_id:)
    # store transaction with cart
    with_cart = StoreCustomer.find(store_customer_id).store_transactions.all.filter do |store_transaction|
      !store_transaction.cart.nil?
    end

    food_orders = with_cart.map do |store_transaction|
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

  def give_warning_store_customer(store_customer_id:)
    store_customer = StoreCustomer.find(store_customer_id)
    store_customer_warning = store_customer[:warning]
    warning_limit = 3

    # customer warning equal to 3 then receive a warning ban store customer
    if store_customer_warning >= warning_limit
      store_customer.update_columns(is_ban: true)
      return {
        status: 200,
        message: 'store customer already have 3 warnings, banning store customer',
        data: {
          store_customer:
        }
      }

    end

    # give store customer warning
    store_customer.update_columns(warning: store_customer_warning + 1)
    {
      status: 200,
      message: 'successfully given store customer a warning',
      data: {
        store_customer:
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

  def ban_store_customer(store_customer_id:)
    store_customer = StoreCustomer.find(store_customer_id)

    store_customer_is_ban = store_customer[:is_ban]

    # inform if store customer already been ban
    if store_customer_is_ban
      return {
        status: 200,
        message: 'store customer is already been banned',
        data: {
          store_customer:
        }
      }
    end

    store_customer.update_columns(is_ban: true)
    {
      status: 200,
      message: 'successfully banned store customer',
      data: {
        store_customer:
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

  def give_food_discount(food_id:, food_discount_percent:)
    food = store.foods.find(food_id)
    food.update_columns(discount: food_discount_percent)

    {
      status: 200,
      message: 'successfully give food a discount',
      data: {
        store_id: food.store[:id],
        food:
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

  def add_new_food(food_info:)
    new_food = store.foods.create!(food_info)
    {
      status: 200,
      message: 'successfully add new food',
      data: {
        food: new_food
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

  def update_food(food_id:, food_info:)
    food = store.foods.find(food_id)
    food.update_columns(food_info)

    {
      status: 200,
      message: 'successfully updated food information',
      data: {
        food_info: food
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

  def remove_food(food_id:)
    # if food has reviews delete reviews first
    store.foods.find(food_id).reviews.where(food_id:).delete_all unless store.foods.find(food_id).reviews.length.zero?

    food = store.foods.find(food_id).delete
    {
      status: 200,
      message: 'successfully removed food',
      data: {
        food:
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

  def process_order(store_customer_id:, store_transaction_id:)
    store_customer = store.store_customers.find(store_customer_id)

    store_transaction_info = store_customer.store_transactions.find(store_transaction_id)

    case store_transaction_info[:status]
    when 'delivered'
      return {
        status: 422,
        message: 'this transaction has already been delivered'
      }
    when 'processing'
      return {
        status: 422,
        message: 'this transaction is already in process'
      }

    when 'canceled'
      return {
        status: 422,
        message: 'this transaction has already been canceled'
      }
    end

    # process order
    store_transaction_info.update_columns(status: 'processing')

    {
      status: 200,
      message: 'successfully process order',
      data: {
        store_transaction: store_transaction_info
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

  def mark_deliver(store_customer_id:, store_transaction_id:)
    store_customer = store.store_customers.find(store_customer_id)
    store_transaction_info = store_customer.store_transactions.find(store_transaction_id)

    case store_transaction_info[:status]
    when 'delivered'
      return {
        status: 422,
        message: 'this transaction has already been delivered'
      }

    when 'pre_process'
      return {
        status: 422,
        message: 'store transaction is still on pre process'
      }

    when 'canceled'
      return {
        status: 422,
        message: 'this transaction has already been canceled'
      }
    end

    # deliver order
    store_transaction_info.update_columns(status: 'delivered')
    {
      status: 200,
      message: 'successfully delivered order',
      data: {
        store_transaction: store_transaction_info
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
  rescue ArgumentError => e
    {
      status: 422,
      message: "'invalid data provided",
      errors: e.message
    }
  end
end
