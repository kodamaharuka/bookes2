class UsersController < ApplicationController

  def index
    @book = Book.new
    @users = User.all
    @user = @book.user
  end

  def show
    @book_new = Book.new
    @user = User.find(params[:id])
    @books = @user.books
  end

  def edit
    @user = User.find(params[:id])
    @user_error = User.new

    if current_user != @user
      redirect_to user_path(current_user.id)
    end

  end

  def new
    @user = User.new
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    @book.save!
    redirect_to book_path(@book.id)
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user.id)
  end

  def update
    @user = User.find(params[:id])

    if @user.update(user_params)
      flash[:notice] = "You have updated user successfully."
      redirect_to user_path(@user.id)
    else
      render action: :edit
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end

  def corrent_user
    @user = User.find(params[:id])
    if current_user != @user
      redirect_to user_path(current_user)
    end
  end

end