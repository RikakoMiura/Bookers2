class UsersController < ApplicationController
   def new
   end
   def create
    @user = user.new(user_params)
    @user_id = current_user.id
    @user.save
    redirect_to user_path(current_user.id)
   end

   def index
      @user=User.new
      @books=Book.all
      @user=User.find(params[:id])
   end
   def show
      @user=User.find(params[:id])
      @books = @user.books.page(params[:page]).reverse_order
   end
   def edit
      @user=User.new
      @user=User.find(params[:id])
   end

   private

   def user_params
     params.require(:user).permit(:name, :profile_image, :introduction)
   end
end
