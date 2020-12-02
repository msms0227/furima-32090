## users テーブル

|Column             |Type    |Options      |
|-------------------|--------|-------------|
| nickname          | string | null: false |
| email             | string | null: false |
| password          | string | null: false |
| encrypted_password| string | null: false |
| last_name         | string | null: false |
| first_name        | string | null: false |
| last_name_kana    | string | null: false |
| first_name_kana   | string | null: false |
| birthday          | date   | null: false |

### Association
- has_many :items
- has_many :buy_records

## items テーブル

|Column             |Type       |Options             |
|-------------------|-----------|--------------------|
| name              | string    | null: false        |
| data              | text      | null: false        |
| category_id       | integer   | null: false        |
| status_id         | integer   | null: false        |
| delivery_fee      | integer   | null: false        |
| area_id           | integer   | null: false        |
| days_id           | integer   | null: false        |
| price             | integer   | null: false        |
| user              | references| foreign_key: true: |

### Association
- belongs_to :user
- has_one    :buy_record

## buy_records テーブル

|Column             |Type       |Options             |
|-------------------|-----------|--------------------|
| user              | references|                    |    
| item              | references|                    |
| place             | references|                    |

### Association
- belongs_to :user
- belongs_to :item
- has_one    :place

## places テーブル

|Column             |Type       |Options             |
|-------------------|-----------|--------------------|
| postal_code       | string    | null: false        |
| prefectures_id    | integer   | null: false        |
| city              | string    | null: false        |
| address           | string    | null: false        |
| building_name     | text      |                    |
| phone_number      | string    | null: false        |
| buy_record        | references|                    |


### Association
- belongs_to :buy_record
