class Book < ApplicationRecord
  belongs_to :library
  has_many :book_transactions
  has_many :transactions, through: :book_transactions


  def checked_out?
    true if self.library_id != nil
  end

  def checkout_class
    if self.checked_out?
      "This is the class info for a book that's already reserved"
    else
      "This is the class for a book that is available for checkout"
    end
  end
end
