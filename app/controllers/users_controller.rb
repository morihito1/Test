class UsersController < ApplicationController
  

  def show
    
     @user = User.find(params[:id])
     @book =Book.new
     @books = @user.books
  end

  def edit
    @user = User.find(params[:id])
    
    unless @user == current_user
    
    redirect_to user_path(current_user.id)
    
    end
  end
  
  def update
    @user = User.find(params[:id])
      if @user.update(user_params)
        flash[:success] = "You have updated user successfully."
        redirect_to user_path(@user)
      else
        render :edit
      end
  end
  
  def index
    @user = current_user
    @users = User.all
    @book = Book.new
  end
  
  private
    def user_params
    
    params.require(:user).permit(:name,:introduction,:profile_image)
    
    end
end
