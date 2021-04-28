class Album < ApplicationRecord
  has_many :album_transactions
  has_many :library_transactions, :through => :album_transactions
end
