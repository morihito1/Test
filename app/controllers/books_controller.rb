class BooksController < ApplicationController
  
    
    
    def show
   
    @book = Book.find(params[:id])
    @profile_image = current_user.profile_image
    @user = @book.user
    @new_book = Book.new
  
    end
    
    def create
    
    @book = Book.new(book_params)
    @book.user = current_user
    if @book.save
      flash[:success] = "You have created user successfully."
      redirect_to book_path(@book)
    else
      @user = current_user 
      @books = Book.all
      render :index
    end
    
    end
    
   
    def index
     
      @user = current_user
      @books = Book.includes(:user).all
      @book = Book.new
      
    end
    
    def edit
      @book = Book.find(params[:id])
      @user = @book.user
       unless current_user == @user
      redirect_to books_path
    end
    end
    
    
    def update
      @book = Book.find(params[:id])
    if @book.update(book_params)
       flash[:success] = 'You have updated user successfully.'
       redirect_to book_path(@book)
    else
      render :edit
    end
    
    end
    
    def destroy
    
    @book =Book.find(params[:id])
    @book.destroy
    redirect_to books_path
    
    end
    
    
    
    private
    
    def book_params
      params.require(:book).permit(:title,:body)
    end
    
end
