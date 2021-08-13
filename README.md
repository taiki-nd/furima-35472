# テーブル設計

## users テーブル

| Column          | Type       | Options     |
| --------------- | ---------- | ----------- |
| name            | string     | null: false |
| email           | string     | null: false |
| password        | string     | null: false |
| last_name       | string     | null: false |
| first_name      | string     | null: false |
| last_name_kana  | string     | null: false |
| first_name_kana | string     | null: false |
| birth_day_y     | integer    | null: false |
| birth_day_m     | integer    | null: false |
| birth_day_d     | integer    | null: false |
| addresses       | references | null: false |

### Association

* has_many :items
* has_one :cards
* has_one addresses

## cards テーブル 

| Column         | Type       | Options     |
| -------------- | ---------- | ----------- |
| customer_id    | integer    | null: false |
| user_id        | integer    | null: false |
| card           | references | null: false |

### association

* belongs_to :user
* belongs_to :item
* gem 'payjp'

## addressesテーブル

| Column         | Type       | Options     |
| -------------- | ---------- | ----------- |
| postal_code    | string     | null: false |
| prefecture     | string     | null: false |
| city           | string     | null: false |
| addresses      | string     | null: false |
| building       | string     | null: false |
| phone_number   | integer    | null: false |
| user_id        | references | null: false |

### association

* belongs_to :user

## itemsテーブル

| Column                   | Type       | Options     |
| ------------------------ | ---------- | ----------- |
| item_name                | text       | null: false |
| item_info                | text       | null: false |
| item_category            | string     | null: false |
| item_sales_status        | string     | null: false |
| item_shipping_fee_status | string     | null: false |
| item_prefecture          | string     | null: false |
| item_scheduled_delivery  | integer    | null: false |
| price                    | integer    | null: false |
| user_id                  | references | null: false |

### Association

* belongs_to :user
* has_one_attached :image
* gem 'mini_magick'
* gem 'image_processing', '~> 1.2'
