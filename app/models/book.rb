class Book < ApplicationRecord
  belongs_to :main_library
  belongs_to :library, optional: :true
  has_many :book_transactions
  has_many :media_transactions, through: :book_transactions

  validates :title, presence: :true
  validates :author, presence: :true
  validates :description, presence: :true, length: {minimum: 100 }, allow_blank: false
  
  # isbn regex
  # /^(?=(?:\D*\d){10}(?:(?:\D*\d){3})?$)[\d-]+$/

end
