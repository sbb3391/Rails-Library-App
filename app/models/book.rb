class Book < ApplicationRecord
  belongs_to :library, optional: :true
  belongs_to :user, optional: :true
  has_many :book_transactions
  has_many :media_transactions, through: :book_transactions

  validates :title, presence: :true
  validates :author, presence: :true
  validates :description, presence: :true, length: {minimum: 100 }, allow_blank: false
  
  # isbn regex
  # /^(?=(?:\D*\d){10}(?:(?:\D*\d){3})?$)[\d-]+$/

  def checked_out?
    true if self.library_id != nil
  end

end
