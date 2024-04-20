class BooksController < ApplicationController
  def create
    @book = Book.new(post_book_params)
    @book.user_id = current_user.id
    @book.save
    redirect_to book_path(@book.id)
  end

  def index
    @books = Book.all
    @users = User.all
  end

  def edit
    book = Book.find(params[:id])
    unless book.user_id == current_user.id
      redirect_to books_path
    end

    @book = Book.find(params[:id])
  end

  def update
    book = Book.find(params[:id])
    unless book.user_id == current_user.id
      redirect_to books_path
    end

    @book = Book.find(params[:id])
    @book.update(post_book_params)
    redirect_to book_path(@book.id)
  end

  def show
    @books = Book.all
    @book = Book.find(params[:id])
    @users = User.all
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path
  end

  private
  # ストロングパラメーター
  def post_book_params
    params.require(:book).permit(:title, :body)
  end
end
