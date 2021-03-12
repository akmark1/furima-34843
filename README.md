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
| category_id      | integer    | null: false                    |
| item_status_id   | integer    | null: false                    |
| delivery_id      | integer    | null: false                    |
| state_id         | integer    | null: false                    |
| delivery_day_id  | integer    | null: false                    |
| item_value       | integer    | null: false                    |
| user             | references | null: false, foreign_key: true |

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
| zip_code       | string     | null: false                    |
| state_id       | integer    | null: false                    |
| city           | string     | null: false                    |
| address_line1  | string     | null: false                    |
| address_line2  | string     |                                |
| phone_number   | string     | null: false                    |
| user           | references | null: false, foreign_key: true |
| item           | references | null: false, foreign_key: true |

### Association

- belongs_to : user
- belongs_to : item
