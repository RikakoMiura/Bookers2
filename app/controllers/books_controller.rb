class BooksController < ApplicationController
  def new
  end
  def create
  end
  def index
    @books=Book.all
  end
  def show
    
  end
  def edit
  end
  def destroy
  end
end
