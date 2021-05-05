class MediaTransactionsController < ApplicationController
  def new
    @transaction = MediaTransaction.new()
    @library_id = params[:library_id]
    @book = Book.find(params["book"]["id"])
  end

  def create 
    lib = Library.find(params[:library_id])

    book_transaction = BookTransaction.new(book_id: params[:book_id], length_days: params[:media_transaction][:book_transaction][:length_days].to_i)
    book_transaction.reservation_end_date = (Date.current + book_transaction.length_days).to_time 
    book_transaction.save
    
    t = book_transaction.build_media_transaction(library_id: lib.id)
    t.save
    
    Book.find_by_id(params[:book_id]).update(library_id: lib.id)

    return redirect_to library_path(lib)
  end

  def show

  end
end
