class OrdersController < ApplicationController

  def index
    @item = Item.find(params[:item_id])
    if user_signed_in? && current_user.id != @item.user_id
      @user_item = UserItem.new
    else
      redirect_to root_path
    end
  end

  def create
    @item = Item.find(params[:item_id])
    @user_item = UserItem.new(order_params)
    if @user_item.valid?
      Payjp.api_key = "sk_test_996bda1a28576c7d1a581b50"
      Payjp::Charge.create(
        amount: @item.price,
        card: order_params[:token],
        currency: 'jpy'
      )
      @user_item.save
      return redirect_to root_path
    else
      render action: :index
    end
  end

  def order_params
    params.require(:user_item).permit(:postal_code, :item_prefecture_id, :city, :addresses, :building, :phone_number).merge(token: params[:token], item_id: params[:item_id], user_id: current_user.id )
  end
  
end
