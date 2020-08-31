# README

## users テーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| nickname | string | null: false |
| email    | string | null: false |
| password | string | null: false |
| birthday | date   | null: false |
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
| name | string | null: false |
| introduction | string | null: false |
| category | integer | null: false |
| item_condition | integer | null: false |
| delivery_fee | integer | null: false |
| shipping_area | integer | null: false |
| shipping_days | integer | null: false |
| user | references | foreign_key: true|

### Association

- belongs_to :user
- has_one :purchases

## order テーブル

| Column | Type   | Options     |
| ------ | ------ | ----------- |
| post_coad | string | null: false |
| prefecture | integer | null: false |
| city | string | null: false |
| banchi | string | null: false |
| building_num | string |      |
| phone_num | string | null: false |
| purchase | references | null: false, foreign_key: true|

- belongs_to :purchase

## purchase テーブル

| Column | Type   | Options     |
| ------ | ------ | ----------- |
| user | references | null: false, foreign_key: true|
| item | references | null: false, foreign_key: true|

belongs_to :user
belongs_to :item
has_one :order
