class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @books = @user.books
    @book = Book.new
  end

  def edit
    @user = User.find(params[:id])
     if @user != current_user
       redirect_to user_path(current_user)
     end
  end

   def update
    @user = User.find(params[:id])
    if @user.update(user_params)
     redirect_to user_path(@user.id)
     flash[:notice] = "You have updated user successfully."
    else
     render :edit
    end
    end

  def index
    @user = current_user
    @users = User.all
    @books = @user.books
    @book = Book.new
  end

   private

  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end

end
