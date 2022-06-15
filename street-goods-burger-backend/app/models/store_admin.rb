class StoreAdmin < ApplicationRecord
  belongs_to :store

  validates :email, presence: true,
                    format: { with: /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i }, # check email format email format
                    uniqueness: true

  validates :password, length: { minimum: 6 }

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
