module BooksHelper
  def checkout_class(book)
    if book.checked_out?
      "mt-6 p-2 bg-red-600 text-lg text-white rounded-xl cursor-not-allowed"
    else
      "mt-6 p-2 bg-indigo-500 text-lg text-white rounded-xl cursor-pointer"
    end
  end

  def disable_checkout_button?(book)
    book.checked_out?
  end

  def checkout_button_text(book)
    book.checked_out? ? "Not Available" : "Checkout Book"
  end

  def reserved_until(book)
    book.book_transactions.last.reservation_end_date.strftime("%m-%d-%Y")
  end

  def availability(book)
    if book.library_id =! nil 
      if book.library_id != 1 && !book.book_transactions.empty?
        "Available on #{book.book_transactions.last.reservation_end_date}"
      else 
        "Available for checkout"
      end
    elsif book.library_id == User.find(session[:user_id]).library.id
      "This book is in your library"
    else
      "This book is available for checkout"
    end
  end

end
