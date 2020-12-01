class User < ApplicationRecord
  has_secure_password

  has_many :favorites
  has_many :products, through: :favorites

  validates :username, presence: true
  validates :email, uniqueness: true, presence: true
end
