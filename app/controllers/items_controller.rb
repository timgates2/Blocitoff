class ItemsController < ApplicationController
    
    def create
        #load user
        #initalize item with stuff from params hash
        # try to save
          #if success, load flash and redirect
          #else, load flash redirect
          
        @user = current_user
        
        @item = Item.new(item_params)
        @item.user = current_user
        
        if @item.save
            flash[:notice] = "Item saved successfully!"
        else
            flash[:error] = "Failed to save item."
        end
        redirect_to user_path(current_user)
    end
    
    def destroy
        @item = Item.find(params[:id])
        
        if @item.destroy
            flash[:notice] = "Item was deleted."
            #redirect_to user_path(current_user)
            respond_to do |format|
                #format.html
                format.js
            end
        else
            flash[:alert] = "Item could not be deleted. Please try again."
            redirect_to user_path(current_user)
        end
    end
    
    private
    
    def item_params
        params.require(:item).permit(:description)
    end
end

