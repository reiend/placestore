class StoreCustomer < ApplicationRecord
  validates :email,
            :first_name,
            :last_name,
            presence: true,
            length: { minimum: 1, maximum: 64 }

  # check email format
  validates :email,
            format: { with: /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i }, # check email format email format
            uniqueness: true

  validates :password,
            length: { minimum: 6 }

  belongs_to :store
  has_many :favorite_foods
  has_many :personal_discounts
  has_many :store_transactions
  has_many :reviews

  include Devise::JWT::RevocationStrategies::JTIMatcher

  devise :database_authenticatable,
         :registerable,
         :validatable,
         :recoverable,
         :confirmable,
         :rememberable,
         :jwt_authenticatable,
         jwt_revocation_strategy: self

  def add_to_cart(store_transaction_id:, ordered_food:)
    store_transaction = store_transactions.find(store_transaction_id)
    has_no_cart = store_transaction.cart.nil?

    # carted food information
    carted_food_quantity = ordered_food[:quantity]
    carted_food_price = ordered_food[:price]
    total_price_food_carted = carted_food_quantity * carted_food_price

    if has_no_cart

      # create new cart if store customer store transaction has no cart
      Cart.create!(
        quantity: carted_food_quantity,
        total_price: total_price_food_carted,
        store_transaction_id:
      )
      {
        status: 200,
        message: 'successfully added food to cart',
        data: {
          store_transaction_id:,
          food_carted: ordered_food
        }
      }

    # store_customer_cart = Cart.create!(quantity: 0, total_price: 0.00, store_transaction_id:);
    else

      # current store customer carted food information
      current_carted_food_quantity = store_transaction.cart[:quantity]
      current_carted_food_total_price = store_transaction.cart[:total_price]

      # add food to store customer cart
      food_carted = store_transaction.cart.food_orders.create!(ordered_food)

      # update cart information based on added food
      store_transaction
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
          food_carted:
        }
      }

    end

    # if can't find StoreTransaction id return nil
  rescue ActiveRecord::RecordNotFound => e
    {
      status: 422,
      message: "can't find that transaction",
      errors: e.message
    }
  rescue NoMethodError => e
    {
      status: 422,
      message: "can't do calculations based on data provided",
      errors: e.message
    }
  end

  def mark_favorite_food(food_info:)
    favorite_food = FavoriteFood.create!(food_info)

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
end
