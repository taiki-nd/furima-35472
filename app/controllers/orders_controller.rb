class OrdersController < ApplicationController

  before_action :set_item, only: [:index, :create]
  before_action :authenticate_user!, only: [:index, :create]

  def index
    if current_user.id != @item.user_id && @item.order == nil
      @user_item = UserItem.new
    else
      redirect_to root_path
    end
  end

  def create
    @user_item = UserItem.new(order_params)
    if @user_item.valid?
      pay_item
      @user_item.save
      return redirect_to root_path
    else
      render action: :index
    end
  end

  private

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: order_params[:token],
      currency: 'jpy'
    )
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def order_params
    params.require(:user_item).permit(:postal_code, :item_prefecture_id, :city, :addresses, :building, :phone_number).merge(token: params[:token], item_id: params[:item_id], user_id: current_user.id )
  end
  
end
