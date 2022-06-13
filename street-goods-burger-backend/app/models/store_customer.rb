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

  include Devise::JWT::RevocationStrategies::JTIMatcher

  devise :database_authenticatable,
         :registerable,
         :validatable,
         :recoverable,
         :confirmable,
         :rememberable,
         :jwt_authenticatable,
         jwt_revocation_strategy: self
end
