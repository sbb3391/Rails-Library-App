class Book < ApplicationRecord
  has_many :book_transactions
  has_many :library_transactions, :through => :book_transactions
end
