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
| birth_day       | text   | null: false |

### Association

* has_many items

## itemsテーブル

| Column                   | Type       | Options     |
| ------------------------ | ---------- | ----------- |
| item_name                | text       | null: false |
| item_info                | text       | null: false |
| item_category            | string     | null: false |
| item_sales_status        | string     | null: false |
| item_shipping_fee_status | string     | null: false |
| item_prefecture          | string     | null: false |
| item_sucheduled_delivery | integer    | null: false |
| price                    | integer    | null: false |
| user                     | references | null: false |

### Association

* belongs_to user

## item_images(active storage)