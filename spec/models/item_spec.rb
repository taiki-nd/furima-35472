require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品の保存' do

    context '商品が出品できる場合' do
      it 'image, item_name, item_info...などすべての情報があれば出品できる' do
        expect(@item).to be_valid
      end
    end

    context '商品が出品できない場合' do
      it 'imageが空では出品できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it 'item_nameが空では出品できない' do
        @item.item_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item name can't be blank")
      end
      it 'item_infoが空では出品できない' do
        @item.item_info = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item info can't be blank")
      end
      it 'item_category_idが空では出品できない' do
        @item.item_category_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item category can't be blank")
      end
      it 'item_sales_status_idが空では出品できない' do
        @item.item_sales_status_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item sales status can't be blank")
      end
      it 'item_shipping_fee_status_idが空では出品できない' do
        @item.item_shipping_fee_status_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item shipping fee status can't be blank")
      end
      it 'item_prefecture_idが空では出品できない' do
        @item.item_prefecture_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item prefecture can't be blank")
      end
      it 'item_scheduled_delivery_idが空では出品できない' do
        @item.item_scheduled_delivery_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item scheduled delivery can't be blank")
      end
      it 'item_category_idが1では出品できない' do
        @item.item_category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Item category can't be blank")
      end
      it 'item_sales_status_idが1では出品できない' do
        @item.item_sales_status_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Item sales status can't be blank")
      end
      it 'item_shipping_fee_status_idが1では出品できない' do
        @item.item_shipping_fee_status_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Item shipping fee status can't be blank")
      end
      it 'item_prefecture_idが1では出品できない' do
        @item.item_prefecture_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Item prefecture can't be blank")
      end
      it 'item_scheduled_delivery_idが1では出品できない' do
        @item.item_scheduled_delivery_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Item scheduled delivery can't be blank")
      end
      it 'priceが空では出品できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it 'priceが299以下では出品できない' do
        @item.price = 290
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
      end
      it 'priceが10000000以上では出品できない' do
        @item.price = 10000100
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999")
      end
      it 'priceが半角英数混合では出品できない' do
        @item.price = '500aa'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end
      it 'priceが半角英語だけでは出品できない' do
        @item.price = 'aaaaa'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end
      it 'priceが半角英語だけでは出品できない' do
        @item.price = '５０００'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end

      it 'ユーザーが紐付いていなければ出品できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('User must exist')
      end
    end
  end
end