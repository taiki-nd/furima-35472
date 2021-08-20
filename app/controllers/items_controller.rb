class ItemsController < ApplicationController

  before_action :authenticate_user!, except: [:index, :show]

  def index
    @items = Item.includes(:user).order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to action: :index
    else
      render :new
    end
  end

  def edit
    @item = Item.find(params[:id])
  end

  def upload
    item = Item.find(params[:id])
    if item.upload(item_params)
      redirect_to action: :show
    else
      render action: :edit
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  private

  def item_params
    params.require(:item).permit(:item_name, :item_info, :item_category_id, :item_sales_status_id, :item_shipping_fee_status_id, :item_prefecture_id, :item_scheduled_delivery_id, :price, :image).merge(user_id: current_user.id)
  end

end
