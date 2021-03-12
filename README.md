# テーブル設計

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| nickname           | string | null: false |
| email              | string | null: false |
| encrypted_password | string | null: false |
| first_name         | string | null: false |
| last_name          | string | null: false |
| first_name_read    | string | null: false |
| last_name_read     | string | null: false |
| birthday_year      | select | null: false |
| birthday_month     | select | null: false |
| birthday_day       | select | null: false |

### Association

- has_many : items
- has_many : comments
- has_many : orders

## items テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| item_name        | string     | null: false                    |
| item_description | text       | null: false                    |
| category         | select     | null: false                    |
| item_status      | select     | null: false                    |
| delivery         | select     | null: false                    |
| item_area        | select     | null: false                    |
| delivery_day     | select     | null: false                    |
| item_value       | string     | null: false                    |
| user             | references | null: false, foreign_key: true |
| image            | Active_storage                              |

### Association

- belongs_to : user
- has_many : comments
- has_one : order

## comments テーブル

| Column | Type   | Options                            |
| ------ | ------ | ---------------------------------- |
| text   | string | null: false                        |
| user   | references | null: false, foreign_key: true |
| item   | references | null: false, foreign_key: true |

### Association

- belongs_to : user
- belongs_to : item

## orders テーブル

| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| card_number    | string     | null: false                    |
| card_exp_month | string     | null: false                    |
| card_exp_year  | string     | null: false                    |
| security_code  | string     | null: false                    |
| zip_code       | string     | null: false                    |
| state          | select     | null: false                    |
| city           | string     | null: false                    |
| address_line1  | string     | null: false                    |
| address_line2  | string     | null: false                    |
| phone_number   | string     | null: false                    |
| user           | references | null: false, foreign_key: true |
| item           | references | null: false, foreign_key: true |

### Association

- belongs_to : user
- belongs_to : item
