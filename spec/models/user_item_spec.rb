require 'rails_helper'

RSpec.describe UserItem, type: :model do
  describe '商品購入情報の保存' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      @user_item = FactoryBot.build(:user_item, user_id: user.id, item_id: item.id)
      sleep 0.1
    end

    context '内容に問題ない場合' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@user_item).to be_valid
      end
      it 'buildingは空でも保存できること' do
        @user_item.building = ''
        expect(@user_item).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it 'postal_codeが空だと保存できないこと' do
        @user_item.postal_code = ''
        @user_item.valid?
        expect(@user_item.errors.full_messages).to include("Postal code can't be blank")
      end
      it 'postal_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
        @user_item.postal_code = '1234567'
        @user_item.valid?
        expect(@user_item.errors.full_messages).to include("Postal code is invalid")
      end
      it 'postal_codeに英字が入っていると保存できないこと' do
        @user_item.postal_code = '123-aaaa'
        @user_item.valid?
        expect(@user_item.errors.full_messages).to include("Postal code is invalid")
      end
      it 'postal_codeに全角が入っていると保存できないこと' do
        @user_item.postal_code = '123-４５６７'
        @user_item.valid?
        expect(@user_item.errors.full_messages).to include("Postal code is invalid")
      end
      it 'postal_codeが3桁-4桁でないと保存できないこと' do
        @user_item.postal_code = "123-458"
        @user_item.valid?
        expect(@user_item.errors.full_messages).to include("Postal code is invalid")
      end
      it 'item_prefecture_idを選択していないと保存できないこと' do
        @user_item.item_prefecture_id = 1
        @user_item.valid?
        expect(@user_item.errors.full_messages).to include("Item prefecture must be other than 1")
      end
      it 'cityが空だと保存できないこと' do
        @user_item.city = ''
        @user_item.valid?
        expect(@user_item.errors.full_messages).to include("City can't be blank")
      end
      it 'addressesが空だと保存できないこと' do
        @user_item.addresses = ''
        @user_item.valid?
        expect(@user_item.errors.full_messages).to include("Addresses can't be blank")
      end
      it 'phone_nunberが空だと保存できないこと' do
        @user_item.phone_number = ''
        @user_item.valid?
        expect(@user_item.errors.full_messages).to include("Phone number can't be blank")
      end
      it 'phone_nunberが9桁以下だと保存できないこと' do
        @user_item.phone_number = '090111122'
        @user_item.valid?
        expect(@user_item.errors.full_messages).to include("Phone number is invalid")
      end
      it 'phone_nunberが12桁以上だと保存できないこと' do
        @user_item.phone_number = '090111122223'
        @user_item.valid?
        expect(@user_item.errors.full_messages).to include("Phone number is invalid")
      end
      it 'phone_nunberに英字が入っていると保存できないこと' do
        @user_item.phone_number = '0901111aaaa'
        @user_item.valid?
        expect(@user_item.errors.full_messages).to include("Phone number is invalid")
      end
      it 'phone_nunberに全角が入っていると保存できないこと' do
        @user_item.phone_number = '0901111４５６７'
        @user_item.valid?
        expect(@user_item.errors.full_messages).to include("Phone number is invalid")
      end
      it "tokenが空では登録できないこと" do
        @user_item.token = nil
        @user_item.valid?
        expect(@user_item.errors.full_messages).to include("Token can't be blank")
      end
      it "user_idが空では登録できないこと" do
        @user_item.user_id = ''
        @user_item.valid?
        expect(@user_item.errors.full_messages).to include("User can't be blank")
      end
      it "item_idが空では登録できないこと" do
        @user_item.item_id = ''
        @user_item.valid?
        expect(@user_item.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end
