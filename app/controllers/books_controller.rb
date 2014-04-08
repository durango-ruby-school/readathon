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
  
  def edit
    @book = Book.find params[:id]
  end
  
  def update
    @book = Book.find params[:id]
    if @book.update_attributes book_params
      flash[:notice] = "Book successfully updated."
      redirect_to @book
    else
      render "edit"
    end
  end
  
  def destroy
    @book = Book.find params[:id]
    if @book.destroy
      flash[:notice] = "Book successfully deleted."
    end
    redirect_to books_path
  end
  
  private
  
  def book_params
    params.require(:book).permit(:title, :pages)
  end
end