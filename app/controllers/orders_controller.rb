class OrdersController < ApplicationController

  def index
    @user_item = UserItem.new
    @item = Item.find(params[:item_id])
  end

  def create
  end

  
  
end
