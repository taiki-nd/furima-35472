class ItemsController < ApplicationController

  before_action :move_to_index, except: :index

  def index

  end

  def new
    @item = Item.new
  end

  def create

  end

  private

  def message_params
    params.require(:item).permit(:item_name, :item_info, :item_category_id, :item_sales_status_id, :item_shipping_fee_status_id, :item_prefecture_id, :item_scheduled_delivery_id, :price, :image).merge(user_id: current_user.id)
  end

  def move_to_index
    unless user_signed_in?
      redirect_to action: :index
    end
  end

end
