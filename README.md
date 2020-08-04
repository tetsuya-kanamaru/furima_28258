# テーブル設計

## Usersテーブル

| Column                | type          | Option                        |
| --------------------- | ------------- | ----------------------------- |
| nickname              | string        | null: false                   |
| email                 | string        | null: false                   |
| password              | string        | null: false                   |
| password_confirmation | string        | null: false                   |
| family_name           | string        | null: false                   |
| given_name            | string        | null: false                   |
| family_name_reading   | string        | null: false                   |
| given_name_reading    | string        | null: false                   |
| birthday              | date          | null: false                   |

### Association
- has_many :items
- has_many :comments
- has_one  :address
- has_many :purchases

## Itemsテーブル

| Column                | type          | Option                         |
| --------------------- | ------------- | ------------------------------ |
| user_id               | references    | null: false, foreign_key: true |
| image                 | text          | null: false                    |
| item_name             | string        | null: false                    |
| item_description      | text          | null: false                    |
| category              | integer       | null: false                    |
| item_condition        | integer       | null: false                    |
| shipping_fee          | integer       | null: false                    |
| shipping_place        | integer       | null: false                    |
| shipping_days         | integer       | null: false                    |
| price                 | integer       | index: true, null:false        |

### Association
- belongs_to :user
- has_many :comments

## Commentsテーブル

| Column                | type          | Option                         |
| --------------------- | ------------- | ------------------------------ |
| user_id               | references    | null: false, foreign_key: true |
| item_id               | references    | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item


## Addressテーブル

| Column                | type          | Option                         |
| --------------------- | ------------- | ------------------------------ |
| user_id               | references    | null: false, foreign_key: true |
| postal_code           | string        | default: "", null: false       |
| prefecture            | integer       | null: false                    |
| city                  | string        | default: "", null: false       |
| house_number          | string        | default: "", null: false       |
| building_name         | string        | default: ""                    |
| phone_number          | integer       | default: "", null: false       |

### Association

- belongs_to user

## Purchaseテーブル

| Column                | type          | Option                         |
| --------------------- | ------------- | ------------------------------ |
| user_id               | references    | null: false, foreign_key: true |

### Association

- belongs_to user
