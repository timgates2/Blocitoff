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
            flash[:notice] = "item saved"
        else
            flash[:error] = "something went wrong"
        end
        redirect_to user_path(current_user)
    end
    
    def destroy
    end
    
    private
    
    def item_params
        params.require(:item).permit(:description)
    end
end

