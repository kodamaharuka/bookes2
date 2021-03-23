class BooksController < ApplicationController

  def index
    @books = Book.all
    @users = User.all
    @book = Book.new
  end

  def show
    @book = Book.find(params[:id])
    @book_new = Book.new
    @user = @book.user
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id

    if @book.save
     flash[:notice] = "You have created book successfully"
     redirect_to book_path(@book.id)
    else
     @books = Book.all
     render action: :index
    end
  end

  def edit
    @book = Book.find(params[:id])

    if current_user != @book.user
      redirect_to books_path
    end
  end

  def update
    @book = Book.find(params[:id])

    if @book.update(book_params)
      flash[:notice] = "You have update book successfully."
      redirect_to book_psth(@book.id)
    else
      render action: :edit
    end
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to book_path
  end

  private
  def book_params
    params.require(:book).permit(:title, :body)
  end

  def corrent_user
    @book = Book.find(params[:id])
    if current_uesr != @book.user
      redirect_to books_path
    end
  end

end
