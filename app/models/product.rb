class Product < ApplicationRecord
  belongs_to :creator, class_name: 'User'

  has_many :favorites
  has_many :users, through: :favorites
end
