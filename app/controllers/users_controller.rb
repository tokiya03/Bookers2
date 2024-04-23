class UsersController < ApplicationController
  def index
    @users = User.all
    @book = Book.new
  end

  def edit
    user = User.find(params[:id])
    unless user.id == current_user.id
      redirect_to user_path(current_user.id)
    end

    @user = User.find(params[:id])
  end

  def update
    user = User.find(params[:id])
    unless user.id == current_user.id
      redirect_to user_path(current_user.id)
    end

    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "You have updated user successfully."
      redirect_to user_path(@user.id)
    else
      render :edit
    end
  end

  def show
    @users = User.all
    @user = User.find(params[:id])
    @books = Book.all
    @book = Book.new
  end

  private
  # ストロングパラメーター
  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end
end
