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
    put 'cancel_order', to: 'cancel_order#update'
    put 'change_password', to: 'change_password#update'
    post 'add_to_cart', to: 'add_to_cart#create'
    post 'create_food_review', to: 'create_food_review#create'
    post 'mark_favorite_food', to: 'mark_favorite_food#create'
    post 'create_store_transaction', to: 'create_store_transaction#create'
  end

  namespace :store_admin do
    get 'view_store_transactions', to: 'view_store_transactions#index'
  end
end
