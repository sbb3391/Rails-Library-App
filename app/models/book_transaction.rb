class BookTransaction < ApplicationRecord
  belongs_to :book
  belongs_to :transaction
end
