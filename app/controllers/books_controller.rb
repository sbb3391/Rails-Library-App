class BooksController < ApplicationController

  def index
    byebug
    @books = Book.all
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(books_params)

    if @book.save 
      return redirect_to book_path(@book)
    else
      render "books/new"
    end
  end

  def edit
  end

  def show
    @book = Book.find_by_id(params[:id])
    @library = User.find(session[:user_id]).library
  end

  def update
  end

  private 

  def books_params
    params.require(:book).permit(:title, :author, :description, :image_path)
  end
end
