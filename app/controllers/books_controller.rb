class BooksController < ApplicationController
  before_action :current_user
  before_action :current_book, only: [:edit, :update]

  def index
    @books = Book.all
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(books_params)
    @book.created_by_user_id = @user.id

    if @book.save 
      return redirect_to book_path(@book)
    else
      render "books/new"
    end
  end

  def edit
    if @book.created_by_user_id == @user.id
      render "books/edit"
    else 
      redirect_to invalid_libraries_path
    end
  end

  def show
    @book = Book.find_by_id(params[:id])
    @library = User.find(session[:user_id]).library
  end

  def update
    if @book.created_by_user_id == @user.id && @book.update(books_params)
      redirect_to book_path(@book)
    else
      render 'books/edit'
    end
  end

  def destroy
    book = Book.find_by_id(params[:id])
    book.destroy

    redirect_to books_path
  end

  def available_books
    @books = Book.available
  end

  def unavailable_books
    @books = Book.unavailable
  end

  private 

  def books_params
    params.require(:book).permit(:title, :author, :description, :image_path)
  end

  def current_book
    @book = Book.find_by_id(params[:id])
  end
end
