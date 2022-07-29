# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
#
#

admin =
  StoreAdmin
  .create!(
    email: 'admin@gmail.com',
    password: 'admin12345',
    password_confirmation: 'admin12345'
  )

admin.confirm

store = admin.stores.create!(
  name: 'Street Goods Burger',
  line1: 'line1',
  line2: 'line2',
  postal_code: '4024',
  city: 'starosa', province: 'laguna'
)

store_customer_one = store
                     .store_customers
                     .create!(
                       first_name: 'store1',
                       last_name: 'customer1',
                       email: 'store_customer1@gmail.com',
                       password: '1234567',
                       password_confirmation: '1234567'
                     )

store_customer_one.confirm

store_customer_second = store
                        .store_customers
                        .create!(
                          first_name: 'store2',
                          last_name: 'customer2',
                          email: 'store_customer2@gmail.com',
                          password: '1234567',
                          password_confirmation: '1234567'
                        )

store_customer_second.confirm
