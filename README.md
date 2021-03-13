# テーブル設計

## users テーブル

| Column             | Type   | Options                 |
| ------------------ | ------ | ----------------------- |
| nickname           | string | null: false             |
| email              | string | null: false unique:true |
| encrypted_password | string | null: false             |
| first_name         | string | null: false             |
| last_name          | string | null: false             |
| first_name_read    | string | null: false             |
| last_name_read     | string | null: false             |
| birthday           | date   | null: false             |

### Association

- has_many : items
- has_many : comments
- has_many : buys

## items テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| name             | string     | null: false                    |
| description      | text       | null: false                    |
| category_id      | integer    | null: false                    |
| status_id        | integer    | null: false                    |
| delivery_id      | integer    | null: false                    |
| state_id         | integer    | null: false                    |
| delivery_day_id  | integer    | null: false                    |
| value            | integer    | null: false                    |
| user             | references | null: false, foreign_key: true |

### Association

- belongs_to : user
- has_many : comments
- has_one : buy

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
| buy            | references | null: false, foreign_key: true |

### Association

- belongs_to : buy

## buys テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| item   | references | null: false, foreign_key: true |

- belongs_to : user
- belongs_to : item
- has_one : order