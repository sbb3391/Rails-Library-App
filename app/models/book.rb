class Book < ApplicationRecord
  belongs_to :library, optional: :true
  has_many :book_transactions
  has_many :media_transactions, through: :book_transactions

  validates :title, presence: :true
  validates :author, presence: :true
  validates :description, presence: :true, length: {minimum: 100 }, allow_blank: false

  scope :out_of_print, -> { where(out_of_print: true) }
  scope :out_of_print_and_expensive, -> { out_of_print.where("price > 500") }

  scope :available_books, -> { where(library_id == nil)}
  scope :unavailable_books, -> { where(library_id != nil)}
  
  # isbn regex
  # /^(?=(?:\D*\d){10}(?:(?:\D*\d){3})?$)[\d-]+$/

end
