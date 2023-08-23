class ItemsController < ApplicationController
  def index
  end

  def new
    unless user_signed_in?
     redirect_to new_user_session_path
    end
    @item = Item.new
  end
   
  def create
    Item.create(item_params)
    redirect_to root_path
  end  
     
  private
   def item_params
    params.require(:item).permit(:title, :detail ,:category_id, :condition_id, :fee_id, :prefecture_id, :duration_id, :price, :image).merge(user_id: current_user.id)

   end


end
