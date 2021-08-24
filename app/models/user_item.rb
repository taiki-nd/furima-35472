class UserItem
  include ActiveModel::Model
  attr_accessor :token, :postal_code, :item_prefecture_id, :city, :addresses, :building, :phone_number, :item_id, :user_id

  with_options presence: true do
    validates :token, :city_name, :addresses
    validates :prefecture_id, numericality: { other_than: 1 }
    validates :postal_code, format: { with: /\A\d{3}[-]\d{4}\z/ }
    validates :phone_number, format: { with: /\A\d{11}\z/ }
    
    with_options format: { with: /\A\d{3}[-]\d{4}\z/ } do
      validates :postal_code, length: { is: 8 } 
    end
  end

  def save
    Address.create(postal_code: postal_code, item_prefecture_id: item_prefecture_id, city: city, addresses: addresses, building: building, phone_number: phone_number)
    Order.create(user_id: user_id, item_id: item_id)
  end
end