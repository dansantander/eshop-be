class User < ApplicationRecord
  has_secure_password

  has_many :favorites
  has_many :products, through: :favorites

  validates :username, presence: true, length: { minimum: 5 }
  validates :email, uniqueness: true, presence: true

  def self.find_authenticate(email, password)
    find_by(email: email).try(:authenticate, password)
  end
end
