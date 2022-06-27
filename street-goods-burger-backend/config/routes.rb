Rails.application.routes.draw do
  # store customer route authentication
  devise_for :store_customers, path: '', path_names: {
    sign_in: 'store_customer/signin',
    sign_out: 'store_customer/signout',
    registration: 'store_customer/signup'
  }, controllers: {
    sessions: 'store_customers/sessions',
    registrations: 'store_customers/registrations'
  }

  # store admin route authentication
  devise_for :store_admins, path: '', path_names: {
    sign_in: 'store_admin/signin',
    sign_out: 'store_admin/signout',
    registration: 'store_admin/signup'
  }, controllers: {
    sessions: 'store_admins/sessions',
    registrations: 'store_admins/registrations'
  }

  namespace :store_customer do
    get 'info', to: 'info#index'
    get 'view_favorite_foods', to: 'view_favorite_foods#index'
    get 'pre_process_orders', to: 'pre_process_order#index'

    put 'cancel_order', to: 'cancel_order#update'
    put 'change_password', to: 'change_password#update'
    put 'like_food', to: 'like_food#update'
    put 'process_food_order', to: 'process_food_order#update'
    put 'deliver_address', to: 'deliver_address#update'

    post 'add_to_cart', to: 'add_to_cart#create'
    post 'create_food_review', to: 'create_food_review#create'
    post 'mark_favorite_food', to: 'mark_favorite_food#create'
    post 'create_store_transaction', to: 'create_store_transaction#create'
  end

  namespace :store_admin do
    get 'view_store_transactions', to: 'view_store_transactions#index'
    get 'view_registered_store_customers', to: 'view_registered_store_customers#index'
    get 'view_store_customer_food_orders', to: 'view_store_customer_food_orders#index'

    put 'give_warning_store_customer', to: 'give_warning_store_customer#update'
    put 'ban_store_customer', to: 'ban_store_customer#update'
    put 'give_food_discount', to: 'give_food_discount#update'
    put 'update_food', to: 'update_food#update'

    post 'give_store_customer_discount', to: 'give_store_customer_discount#create'
    post 'add_new_food', to: 'add_new_food#create'

    delete 'remove_food', to: 'remove_food#destroy'
  end

  scope module: 'stores' do
    get 'store/food', to: 'food#store_foods'
  end

  scope module: 'payments' do
    post 'paymongo/gcash/auth', to: 'paymongo#gcash_auth'
    post 'paymongo/gcash/payment', to: 'paymongo#payment'
  end
end
