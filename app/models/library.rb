class Library < ApplicationRecord
  belongs_to :user
  has_many :library_transactions
  has_many :books, through: :library_transactions
  has_many :albums, through: :library_transactions
end
