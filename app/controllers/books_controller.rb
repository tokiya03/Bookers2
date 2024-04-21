class BooksController < ApplicationController
  def create
    @books = Book.all
    @book = Book.new(post_book_params)
    @book.user_id = current_user.id
    if @book.save
      flash[:notice] = "You have created book successfully."
      redirect_to book_path(@book.id)
    else
      render :index
    end
  end

  def index
    @books = Book.all
    @book = Book.new
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
    if @book.update(post_book_params)
      flash[:notice] = "You have updated book successfully."
      redirect_to book_path(@book.id)
    else
      render :edit
    end
  end

  def show
    @books = Book.all
    @book = Book.find(params[:id])
    @user = @book.user
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
