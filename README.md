## users テーブル

|Column             |Type    |Options      |
|-------------------|--------|-------------|
| nickname          | string | null: false |
| email             | string | null: false |
| password          | string | null: false |
| last_name         | string | null: false |
| first_name        | string | null: false |
| last_name_kana    | string | null: false |
| first_name_kana   | string | null: false |
| birthday          | string | null: false |

### Association
- has_many :items
- has_many :buy_record

## items テーブル

|Column             |Type       |Options             |
|-------------------|-----------|--------------------|
| name              | string    | null: false        |
| data              | text      | null: false        |
| category          | string    | null: false        |
| status            | string    | null: false        |
| delivery_fee      | integer   | null: false        |
| area              | string    | null: false        |
| days              | string    | null: false        |
| price             | integer   | null: false        |
| user              | references| foreign_key: true: |

### Association
- belongs_to :users
- has_one    :buy_records

## buy_records テーブル

|Column             |Type       |Options             |
|-------------------|-----------|--------------------|
| user              | references| foreign_key: true: |
| item              | references| foreign_key: true: |
| place             | references| foreign_key: true: |

### Association
- belongs_to :users
- belongs_to :items
- has_one    :places

## places テーブル

|Column             |Type       |Options             |
|-------------------|-----------|--------------------|
| postal_code       | string    | null: false        |
| prefectures       | string    | null: false        |
| city              | string    | null: false        |
| address           | string    | null: false        |
| building_name     | text      |                    |
| number            | string    | null: false        |

### Association
- belongs_to :buy_records
