class User < ApplicationRecord
  has_one :library
  has_many :transactions, through: :library
end
