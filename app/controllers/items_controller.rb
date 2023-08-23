class ItemsController < ApplicationController
  def index
  end

  def new
    @item = Item.new
  end
   
  def create
    binding.pry
    Item.create(item_params)
    redirect_to root_path
  end  
     
  private
   def item_params
    params.require(:item).permit(:title, :detail ,:category_id, :condition_id, :fee_id, :prefecture_id, :duration_id, :price, :image).merge(user_id: current_user.id)

   end


end
