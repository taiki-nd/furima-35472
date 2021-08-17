class Item < ApplicationRecord

  with_options presence: true do
    validates :image, presence: true
    validates :item_name
    validates :item_info
    validates :item_category_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :item_sales_status_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :item_shipping_fee_status_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :item_prefecture_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :item_scheduled_delivery_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :price, format: { with: /\A[0-9]+\z/ }, numericality: { less_than_or_equal_to: 9999999, greater_than_or_equal_to: 300 }
  end

  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :item_category
  belongs_to :item_sales_status
  belongs_to :item_shipping_fee_status
  belongs_to :item_scheduled_delivery
  belongs_to :item_prefecture

end
