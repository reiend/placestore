# frozen_string_literal: true

# StoreAdminFeatures module
module StoreAdminFeatures
  def view_store_transactions(store_id:)
    store_transactions = StoreTransaction.where(store_id:).map do |transaction|
      store_transaction_id = transaction[:id]

      # get store transaction corressponding cart
      cart_info = JSON.parse(Cart.where(store_transaction_id:).to_json)[0]
      cart_info_id = cart_info['id']

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
    food = Food.find(food_id)
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
end
