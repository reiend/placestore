class Account < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  validates :email,
            :first_name,
            :last_name,
            presence: true,
            length: { minimum: 0, maximum: 64 }
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
