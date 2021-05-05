module BooksHelper
  def checkout_class(book)
    if book.checked_out?
      "This is the class info for a book that's already reserved"
    else
      "mt-6 p-2 bg-indigo-400 text-white rounded-xl cursor-pointer"
    end
  end
end
