class BooksController < ApplicationController
before_action :authenticate_user!, only: [:show, :index, :edit]

  def top
  end

  def about
  end

  def index
      @books = Book.all
      @book = Book.new
  end

  def show
      @book = Book.find(params[:id])
  end

  def create
      @book = Book.new(book_params)
      @book.user_id = current_user.id
      if @book.save
         flash[:notice] = 'you have created book successfully'
        redirect_to book_path(@book)
      else
        @books = Book.all
        render action: :index
      end
  end

  def edit
      @book = Book.find(params[:id])
  end

  def update
      @book = Book.find(params[:id])
      if @book.update(book_params)
         flash[:notice] = 'you have created book successfully'
        redirect_to book_path(@book)
      else
        render action: :edit
      end
  end

  def destroy
      book = Book.find(params[:id])
      book.destroy
      flash[:notice] = 'Book was successfully destroyed.'
      redirect_to books_path
  end

  private
  def book_params
    params.require(:book).permit(:title, :body)
  end
end

