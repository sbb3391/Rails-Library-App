class BookTransaction < ApplicationRecord
  belongs_to :transactions
  belongs_to :book
end
