class Book < ApplicationRecord
  belongs_to :library
  has_many :book_transactions
  has_many :transactions, through: :book_transactions
end
