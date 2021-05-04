class Library < ApplicationRecord
  belongs_to :user
  has_many :books
  has_many :media_transactions
end
