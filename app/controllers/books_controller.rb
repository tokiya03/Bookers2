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
    @book = Book.find(params[:id])
    @book.user.id = current_user.id
    @book.update
    redirect_to book_path
  end

  def show
    @book = Book.find(params[:id])
    @users = User.all
  end

  private
  # ストロングパラメーター
  def post_book_params
    params.require(:book).permit(:title, :body)
  end
end
