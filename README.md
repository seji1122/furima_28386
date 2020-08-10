# README

## users テーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| nickname | string | null: false |
| email    | string | null: false |
| password | string | null: false |
|name_knaji| string |             |
|name_katakana| string |          |

### Association

- has_many :items

## items テーブル

| Column | Type   | Options     |
| ------ | ------ | ----------- |
| image   | string | null: false |
| item_name |      |             |
| item_introduce|  |             |

### Association

- belongs_to :user

## purchase テーブル

| Column | Type   | Options     |
| ------ | ------ | ----------- |
| card_num |      |             |
| cvv2   |        |             |
| card_data |     |             |


### Association

- has_one :delivery

## delivery テーブル

| Column | Type   | Options     |
| ------ | ------ | ----------- |
| post_coad |     |          |
| city   |        |             |
|

- belongs_to :purchase