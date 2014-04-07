class BooksController < ApplicationController
  def index
  end
  
  def new
    @book = Book.new
  end
  
  def create
    @book = Book.new book_params
    if @book.save
      flash[:notice] = "Book successfully created."
      redirect_to @book
    else
      render "new"
    end
  end
  
  def show
    @book = Book.find params[:id]
  end
  
  private
  
  def book_params
    params.require(:book).permit(:title, :pages)
  end
end