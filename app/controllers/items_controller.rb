class ItemsController < ApplicationController
  def index
  end

  def new
    @item = Item.new
  end
   
  def create
    Item.create(item_params)

  end  
     
  private
   def item_params
    params.require(:item).permit(:title, :detail ,:category_od, :condition_id, :fee_id, :prefecture_id, :duration_id, :price, :image).merge(user_id: current_user.id)

   end
  end


end
