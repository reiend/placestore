Rails.application.routes.draw do
  devise_for :store_customers, path: '', path_names: {
    sign_in: 'store_customer/signin',
    sign_out: 'store_customer/signout',
    registration: 'store_customer/signup'
  }, controllers: {
    sessions: 'store_customers/sessions',
    registrations: 'store_customers/registrations'
  }

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
    put 'cancel_order', to: 'cancel_order#update'
    put 'change_password', to: 'change_password#update'
    post 'add_to_cart', to: 'add_to_cart#create'
  end
end
