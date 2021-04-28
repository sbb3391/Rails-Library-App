class BookTransaction < ApplicationRecord
  belongs_to :book
  belongs_to :library_transaction
end
