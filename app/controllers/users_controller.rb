class UsersController < ApplicationController
    def new
        @user = User.new
    end
    
    def show
        @user = User.find(params[:id])
    end
    
    
    def destroy
     @user= User.find(params[:id])
     item= @user.item.find(params[:id])
 
     if item.destroy
     flash[:notice] = "Item was deleted."
     
     else
     flash[:alert] = "Item couldn't be deleted. Try again."
     end
    end
end
