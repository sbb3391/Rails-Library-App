class MediaTransaction < ApplicationRecord
  has_many :book_transactions
  has_many :books, through: :book_transactions
  belongs_to :library
  accepts_nested_attributes_for :book_transactions
  
end
