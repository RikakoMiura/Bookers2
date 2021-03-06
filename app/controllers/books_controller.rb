class BooksController < ApplicationController
  before_action :ensure_current_user, {only: [:edit, :update]}
  def ensure_current_user
    @book=Book.find(params[:id])
    if @book.user_id != current_user.id
      redirect_to books_path
    end
  end

  def create
    @book=Book.new(book_params)
    @book.user=current_user
    if @book.save
      flash[:notice] = 'You have created book successfully.'
      redirect_to book_path(@book)
    else
      @books=Book.all
      render "index"
    end
  end
  def index
    @book=Book.new
    @books=Book.all
  end
  def show
    @newbook=Book.new
    @book=Book.find(params[:id])
    @books=Book.all
  end
  def edit
    @book=Book.find(params[:id])

  end
  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path
  end
  def update
    @book = Book.find(params[:id])
    if  @book.update(book_params)
      flash[:notice] = 'You have updated book successfully.'
      redirect_to book_path(@book)
    else
      render "edit"
    end
  end

  private
  def book_params
    params.require(:book).permit(:title, :body, :user_id)
  end


end
