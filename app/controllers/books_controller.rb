class BooksController < ApplicationController
  before_filter :find_book, only: [:show, :edit, :update, :destroy]
  
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
  end
  
  def edit
  end
  
  def update
    if @book.update_attributes book_params
      flash[:notice] = "Book successfully updated."
      redirect_to @book
    else
      render "edit"
    end
  end
  
  def destroy
    if @book.destroy
      flash[:notice] = "Book successfully deleted."
    end
    redirect_to books_path
  end
  
  private
  
  def book_params
    params.require(:book).permit(:title, :pages)
  end
  
  def find_book
    @book = Book.find params[:id]
  end
end