class MediaTransactionsController < ApplicationController
  def new
    @library = Library.find(params[:library_id])
    @media_transaction = @library.media_transactions.build
    @book_transaction = @media_transaction.book_transactions.build
    @book = Book.find(params["book"]["id"])
    render "media_transactions/new"
  end

  def create 
    lib = Library.find(params[:library_id])
    transaction_params = params[:media_transaction][:book_transactions_attributes]["0"]
    transaction_params[:reservation_end_date] = (Date.current + transaction_params[:length_days].to_i).to_time

    media_transaction = lib.media_transactions.build(media_transaction_params)
    media_transaction.save
    
    Book.find_by_id(transaction_params[:book_id]).update(library_id: lib.id)

    return redirect_to library_path(lib)
  end

  def index
    @library = Library.find_by_id(params[:library_id])
    @media_transactions = @library.media_transactions
  end

  private

  def media_transaction_params
    params.require(:media_transaction).permit(:libary_id, :reservation_end_date, book_transactions_attributes: [:length_days, :book_id, :reservation_end_date])
  end
end
