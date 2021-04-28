class User < ApplicationRecord
  has_one :library
  has_secure_password
  validates :username, presence: true, length: {minimum: 3, maximum: 25}, uniqueness: true
  validates :email, presence: true
  validates :password, presence: true
  validates_confirmation_of :password
end
