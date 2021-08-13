# テーブル設計

## users テーブル

| Column          | Type   | Options     |
| --------------- | ------ | ----------- |
| name            | string | null: false |
| email           | string | null: false |
| password        | string | null: false |
| last_name       | string | null: false |
| first_name      | string | null: false |
| last_name_kana  | string | null: false |
| first_name_kana | string | null: false |
| birth_day       | date   | null: false |

### Association

* has_many :items
* has_many :orders

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
| user                     | references | null: false |

### Association

* belongs_to :user
* has_many :orders
* has_one_attached :image
* gem 'mini_magick'
* gem 'image_processing', '~> 1.2'

## orders テーブル 

| Column         | Type       | Options     |
| -------------- | ---------- | ----------- |
| card_number    | integer    | null: false |
| card_exp_month | integer    | null: false |
| card_exp_year  | integer    | null: false |
| cad_cvc        | integer    | null: false |
| postal_code    | string     | null: false |
| prefecture     | string     | null: false |
| city           | string     | null: false |
| addresses      | string     | null: false |
| building       | references | null: false |
| phone_number   | references | null: false |
| user           | references | null: false |
| item           | references | null: false |

### association

* belongs_to :user
* belongs_to :item