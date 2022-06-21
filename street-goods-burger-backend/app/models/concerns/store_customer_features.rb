# frozen_string_literal: true

# StoreCustomerFeatures's module
module StoreCustomerFeatures
  def add_to_cart(ordered_food:)
    if store_transactions.length.zero?
      return {
        status: 422,
        message: 'please create store transaction first'
      }
    end

    store_transaction_info = store_transactions.last
    store_transaction_id = store_transaction_info[:id]
    has_no_cart = store_transaction_info.cart.nil?

    # carted food information
    carted_food_quantity = ordered_food[:quantity]
    carted_food_price = ordered_food[:price]
    total_price_food_carted = carted_food_quantity * carted_food_price

    case store_transaction_info[:status]
    when 'delivered'
      return {
        status: 422,
        message: 'this transaction has already been delivered'
      }

    when 'processing'
      return {
        status: 422,
        message: 'this transaction is in process'
      }

    when 'canceled'
      return {
        status: 422,
        message: 'this transaction has already been canceled'
      }
    end

    if has_no_cart

      # create new cart if store customer store transaction has no cart
      cart = Cart.create!(
        quantity: carted_food_quantity,
        total_price: total_price_food_carted,
        store_transaction_id:
      )

      cart.food_orders.create!(ordered_food)

      {
        status: 200,
        message: 'successfully added food to cart',
        data: {
          store_transaction_id:,
          cart_total_price: cart[:total_price],
          cart_total_quantity: cart[:quantity],
          food_carted: ordered_food
        }
      }

    else
      # uses existing cart here

      # current store customer carted food information
      current_carted_food_quantity = store_transaction_info.cart[:quantity]
      current_carted_food_total_price = store_transaction_info.cart[:total_price]

      # add food to store customer cart
      food_carted = store_transaction_info.cart.food_orders.create!(ordered_food)

      # update cart information based on added food
      store_transaction_info
        .cart
        .update(
          quantity: (current_carted_food_quantity + carted_food_quantity).to_i,
          total_price: (current_carted_food_total_price + total_price_food_carted).to_d
        )

      {
        status: 200,
        message: 'successfully added food to cart',
        data: {
          store_transaction_id:,
          cart_total_price: store_transaction_info.cart[:total_price],
          cart_total_quantity: store_transaction_info.cart[:quantity],
          food_carted:
        }
      }

    end

    # if can't find StoreTransaction id return nil
  rescue ActiveRecord::RecordInvalid => e
    {
      status: 400,
      message: 'please enter valid food attribute ',
      error: e.message
    }
  rescue ActiveRecord::RecordNotFound => e
    {
      status: 422,
      message: 'please enter valid food attribute',
      errors: e.message
    }
  rescue NoMethodError => e
    {
      status: 422,
      message: "can't do calculations based on data provided",
      errors: e.message
    }
  end

  def create_store_transaction
    if store_transactions.length.zero?
      store_transaction = StoreTransaction.new(store_customer_id: id, store_id:)
      store_transaction.save
      {
        status: 200,
        message: 'successfully create a store transaction',
        data: {
          store_transaction:
        }
      }
    else
      current_store_transaction_status = store_transactions.last[:status]

      if current_store_transaction_status == 'pending'
        return {
          status: 422,
          message: 'store customer have a pending store transaction',
          data: {
            store_transaction: store_transactions.last
          }
        }
      end

      store_transaction = StoreTransaction.new(store_customer_id: id, store_id:)
      store_transaction.save

      {
        status: 200,
        message: 'successfully create a store transaction',
        data: {
          store_transaction:
        }

      }
    end
  rescue ActiveRecord::RecordInvalid => e
    {
      status: 400,
      message: 'please enter valid food attribute ',
      error: e.message
    }
  rescue ActiveRecord::RecordNotFound => e
    {
      status: 422,
      message: 'please enter valid food attribute',
      errors: e.message
    }
  rescue NoMethodError => e
    {
      status: 422,
      message: "can't do calculations based on data provided",
      errors: e.message
    }
  end

  def mark_favorite_food(store_customer_id:, food_info:)
    favorite_food = StoreCustomer.where(id: store_customer_id)[0].favorite_foods.create!(food_info)

    {
      status: 200,
      message: 'successfully mark food as favorite',
      data: {
        favorite_food:
      }
    }
  rescue ActiveRecord::RecordInvalid => e
    {
      status: 422,
      message: 'please enter valid food attribute ',
      error: e.message
    }
  rescue ActiveModel::UnknownAttributeError => e
    {
      status: 422,
      message: 'please enter valid food attribute ',
      error: e.message
    }
  rescue NoMethodError => e
    {
      status: 422,
      message: "can't do calculations based on data provided",
      error: e.message
    }
  end

  def create_food_review(food_review_info:)
    has_food = Food.find(food_review_info[:food_id])

    if has_food
      food_review = reviews.create!(food_review_info)

      {
        status: 200,
        message: 'successfully create a food review',
        data: {
          reviewer: {
            email:,
            first_name:,
            last_name:
          },
          food_review: {
            review: food_review[:text_body],
            food_reviewed: Food.find(food_review[:food_id])
          }
        }
      }
    end
  rescue ActiveRecord::RecordInvalid => e
    {
      status: 422,
      message: 'please enter valid params ',
      error: e.message
    }
  rescue ActiveRecord::RecordNotFound => e
    {
      status: 400,
      message: 'cannot find requested resource',
      error: e.message
    }
  rescue ActiveModel::UnknownAttributeError => e
    {
      status: 422,
      message: 'please enter valid food review information ',
      error: e.message
    }
  end

  def view_favorite_foods
    {
      status: 200,
      message: 'successfully fetch store customer reviews',
      data: {
        store_customer_reviews: favorite_foods.all
      }
    }
  end

  def change_password(password:)
    new_password = password[:new_password]
    new_password_confirmation = password[:new_password_confirmation]

    if new_password == new_password_confirmation
      return {
        status: 200,
        message: 'successfully change password'
      }
    end
    {
      status: 422,
      message: "password doesn't match"
    }
  end

  def cancel_order(store_transaction_id:)
    store_transaction = store_transactions.find(store_transaction_id)
    store_transaction_status = store_transaction[:status]

    case store_transaction_status
    when 'pending'
      store_transaction.update!(status: 'canceled')
      {
        status: 200,
        message: 'successfully canceled order'
      }
    when 'pre_process'
      store_transaction.update!(status: 'canceled')
      {
        status: 200,
        message: 'successfully canceled order'
      }
    when 'canceled'
      {
        status: 200,
        message: 'order is already been canceled'
      }
    when 'processing'
      {
        status: 200,
        message: 'sorry, you cannot cancel this transaction, your order is being process'
      }
    when 'delivered'
      {
        status: 200,
        message: 'food was already been delivered '
      }
    else
      {
        status: 400,
        message: 'invalid transaction'
      }
    end
  rescue ActiveRecord::RecordNotFound => e
    {
      status: 422,
      message: 'cannot find that store transaction',
      error: e.message
    }
  end

  def like_food(food_id:)
    food_info = store.foods.find(food_id)
    current_food_likes = food_info[:like]

    food_info.update_columns(like: current_food_likes + 1)

    {
      status: 200,
      message: 'successfully like food',
      food_like_info: food_info
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

  def process_food_order(store_transaction_id:)
    store_transaction = store_transactions.find(store_transaction_id)

    store_transaction_status = store_transaction[:status]

    case store_transaction_status
    when 'pending'
      store_transaction.update!(status: 'pre_process')
      {
        status: 200,
        message: 'successfully pre process order'
      }
    when 'pre_process'
      {
        status: 200,
        message: 'food order is already in pre process'
      }
    when 'canceled'
      {
        status: 200,
        message: 'order is already been canceled'
      }
    when 'processing'
      {
        status: 200,
        message: 'sorry, you cannot cancel this transaction, your order is being process'
      }
    when 'delivered'
      {
        status: 200,
        message: 'food was already been delivered '
      }
    else
      {
        status: 400,
        message: 'invalid transaction'
      }
    end
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
