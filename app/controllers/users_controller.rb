class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
      @user = User.find(params[:id])
      if @user.id = current_user.id
        @user.update(user_params)
        redirect_to user_path(current_user.id)
      else
        render edit_user_path(current_user.id)
      end
  end

  def show
    @users = User.all
    @books = Book.all
    @user = User.find(params[:id])
  end

  private
  # ストロングパラメーター
  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end
end
