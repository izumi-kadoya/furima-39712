class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new]
  before_action :set_item, only: [:show, :edit]

  def index
    @items = Item.all.order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
  end

  def edit
    @tweet = Tweet.find(params[:id])　　←beforeaction使う　,:edit
  end

  def update
    item = Item.find(params[:id])
     if     item.update(item_params)
       redirect_to root_path
     else
       render :edit, status: :unprocessable_entity
     end
  end

  private

  def item_params
    params.require(:item).permit(:title, :detail, :category_id, :condition_id, :fee_id, :prefecture_id, :duration_id, :price,
                                 :image).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end
end
