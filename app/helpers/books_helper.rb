module BooksHelper
  def checked_out?(book)
    true if book.library_id != nil
  end
  
  def checkout_class(book)
    if checked_out?(book)
      "mt-6 p-2 bg-red-600 text-lg text-white rounded-xl cursor-not-allowed"
    else
      "mt-6 p-2 bg-indigo-500 text-lg text-white rounded-xl cursor-pointer"
    end
  end

  def disable_checkout_button?(book)
    checked_out?(book)
  end

  def checkout_button_text(book)
    checked_out?(book) ? "Not Available" : "Checkout Book"
  end

  def reserved_until(book)
    book.book_transactions.last.reservation_end_date.strftime("%m-%d-%Y")
  end

  def days_until_reservation_ends

  end

  def availability(book)
    if book.library_id != User.find(session[:user_id]).library.id && book.library_id != nil && !book.book_transactions.empty?
      "Available on #{reserved_until(book)}"
    elsif book.library_id == User.find(session[:user_id]).library.id
      "This book is in your library"
    else
      "Available"
    end
  end

  def availability_class(book)
    if availability(book) == "Available"
      "w-6/12 mb-3 mx-auto text-center font-bold bg-green-500 text-white text-sm rounded-xl"
    elsif availability(book) == "This book is in your library"
      "w-8/12 mb-3 mx-auto text-center font-bold bg-blue-500 text-white text-sm rounded-xl"
    else
      "w-8/12 mb-3 mx-auto text-center font-bold bg-red-500 text-white text-sm rounded-xl"
    end
  end

end
