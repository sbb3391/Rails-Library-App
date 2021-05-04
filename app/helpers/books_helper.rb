module BooksHelper
  def checkout_class(book)
    if book.checked_out?
      "This is the class info for a book that's already reserved"
    else
      "This is the class for a book that is available for checkout"
    end
  end
end
