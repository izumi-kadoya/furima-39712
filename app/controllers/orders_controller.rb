class OrdersController < ApplicationController
  before_action :set_item, only: [:index, :create]
  def index
  end

  def new
    @purchase_address = PurchaseAddress.new
  end

  def create
    @purchase_address = PurchaseAddress.new(purchase_params)
    if @purchase_address.save
      redirect_to root_path 
    else
      render :new 
    end
  end

private
def set_item
  @item = Item.find(params[:item_id])
end

def purchase_params
 params.require(:purchase_address).permit(:postcode, :prefecture, :city, :street, :building, :tel).merge(user_id: current_user.id,item_id: @item.id)
end

end
