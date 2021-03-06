class UsersController < ApplicationController
   before_action :ensure_current_user, {only: [:edit, :update]}
   def ensure_current_user
     if current_user.id != params[:id].to_i
       redirect_to user_path(current_user)
     end
   end

   def create
     user=User.new(user_params)
     user.save
     redirect_to user_path(current_user)
   end

   def index
      @users=User.all
      @user=current_user
      @book=Book.new
   end

   def show
       @user=User.find(params[:id])
       @book=Book.new
       @books = @user.books.page(params[:page]).reverse_order
   end

   def edit
     @user=User.new
     @user=User.find(params[:id])

   end
   def update
     @user = User.find(params[:id])
     if @user.update(user_params)
       flash[:notice] = 'You have updated user successfully.'
       redirect_to user_path(current_user)
     else
       render "edit"
     end
   end

   private
   def user_params
      params.require(:user).permit(:name,:introduction,:profile_image)
   end


end
