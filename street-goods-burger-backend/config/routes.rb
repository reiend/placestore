Rails.application.routes.draw do

  devise_for :store_customers, path: '', path_names: {
    sign_in: 'store_customer/sign_in',
    sign_out: 'store_customer/sign_out',
    registration: 'store_customer/sign_up'
  }, controllers: {
    sessions: 'store_customers/sessions',
    registrations: 'store_customers/registrations'
  }

  devise_for :store_admins, path: '', path_names: {
    sign_in: 'store_admin/sign_in',
    sign_out: 'store_admin/sign_out',
    registration: 'store_admin/sign_up'
  }, controllers: {
    sessions: 'store_admins/sessions',
    registrations: 'store_admins/registrations'
  }
end
