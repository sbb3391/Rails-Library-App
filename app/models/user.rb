class User < ApplicationRecord
  has_one :library
  has_secure_password
end
