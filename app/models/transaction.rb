class Transaction < ApplicationRecord
  has_many :book_transactions
  has_many :transactions, through: :book_transactions
end
