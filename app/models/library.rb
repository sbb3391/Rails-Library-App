class Library < ApplicationRecord
  belongs_to :user
  has_many :transactions
  has_many :books, through: :transactions
  has_many :albums, through: transactions
end
