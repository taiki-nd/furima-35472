class Item < ApplicationRecord

  with_options presence: true do
    validates :item_name
    validates :item_info
    validates :item_category_id
    validates :item_sales_status_id
    validates :item_shipping_fee_status_id
    validates :item_prefecture_id
    validates :item_scheduled_delivery_id
    validates :price, format: { with: /\A[0-9]+\z/ }, numericality: { less_than_or_equal_to: 9999999, greater_than_or_equal_to: 300 }
  end

  belongs_to :user
  has_one_attached :image
end
