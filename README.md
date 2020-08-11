# README

## users テーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| nickname | string | null: false |
| email    | string | null: false |
| password | string | null: false |
|first_name | string | null: false |
|family_name | string | null: false |
|first_name_furigana | string | null: false |
|family_name_furigana | string | null: false |

### Association

- has_many :items
- has_many :purchases

## items テーブル

| Column | Type   | Options     |
| ------ | ------ | ----------- |
| image   | string | null: false |
| item_name | string | null: false |
| item_introduction | string | null: false |
|category | string | null: false |
|item_condition | string | null: false |
| delivery_fee | string | null: false |
|shipping_area | string | null: false |
|shipping_days | string | null: false |
| user | references | foreign_key: true|

### Association

- belongs_to :user
- has_one :purchases

## delivery テーブル

| Column | Type   | Options     |
| ------ | ------ | ----------- |
| post_coad | string | null: false |
| city   | string | null: false |
| shityouson | string | null: false |
| banci | string | null: false |
| buliding_num | string | null: false |
| phone_num | string | null: false |
| purchase | references | null: false, foreign_key: true|

- belongs_to :purchase

## purchases テーブル

| Column | Type   | Options     |
| ------ | ------ | ----------- |
| user | references | null: false, foreign_key: true|
| item | references | null: false |

belongs_to :user
belongs_to :item
has_one :delivery