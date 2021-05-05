class BookTransaction < ApplicationRecord
  belongs_to :book
  belongs_to :media_transaction, optional: true
end
