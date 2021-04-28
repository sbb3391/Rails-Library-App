class LibraryTransaction < ApplicationRecord
  belongs_to :library
  has_many :book_transactions
  has_many :books, through: :book_transactions
  has_many :album_transactions
  has_many :albums, through: :album_transactions
end
