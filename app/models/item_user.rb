class ItemUser < ApplicationRecord
  include ActiveModel::Model
  attr_accessor :name, :email, :encrypted_password, :first_name, 
                :family_name, :first_name_kana, :family_name_kana, 
                :birth_day, :image, :item_name, :item_shipping_fee_status_id, 
                :item_prefecture_id, :price, :postal_code, :item_prefecture_id, 
                :city, :addresses, :building_name, :phone_number

  # ここにバリデーションの処理を書く
  with_options presence: true do
    validates :name
    validates :email
    validates :password, format: { with: /\A[a-zA-Z0-9]+\z/ }
    validates :last_name, format: { with: /\A[ぁ-んァ-ン一-龥々]+\z/ }
    validates :first_name, format: { with: /\A[ぁ-んァ-ン一-龥々]+\z/ }
    validates :last_name_kana, format: { with: /\A[ァ-ヶー－]+\z/ }
    validates :first_name_kana, format: { with: /\A[ァ-ヶー－]+\z/ }
    validates :birth_day

    validates :image
    validates :item_name
    validates :price, format: { with: /\A[0-9]+\z/ }, numericality: { less_than_or_equal_to: 9999999, greater_than_or_equal_to: 300 }
  end

  with_options numericality: { other_than: 1, message: "can't be blank" } do
    validates :item_shipping_fee_status_id
    validates :item_prefecture_id
  end

  def save
    user =  User.create(nickname: nickname, email: email, encrypted_password: encrypted_password, first_name: first_name, family_name: family_name, first_name_kana: first_name_kana, family_name_kana: family_name_kana, birth_day: birth_day)
    Order.create(user_id: user_id, item_id: item_id)
    Address.create(postal_code: postal_code, item_prefecture_id: item_prefecture.id, city: city, addresses: addresses, building: building, phone_number: phone_number, order_id: order.id)
    Item.create(image: image, item_name: item_name, item_shipping_fee_status_id: item_shipping_fee_status.id, item_prefecture_id: item_prefecture.id, price: price, user_id: user.id)
  end
end
