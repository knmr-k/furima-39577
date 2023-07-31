# テーブル設計

## usersテーブル

| Column | Type | Options |
| --- | --- | --- |
| email | string | null: false, unique: true|
| encrypted_password | string | null: false|
| nickname（ニックネーム） | string | null: false|
| last_name（名字） | string | null: false |
| first_name（名前） | string | null: false|
| last_name_kana（名字カナ） | string | null: false|
| first_name_kana（名前カナ） | string | null: false|
| birthday（生年月日） | date | null: false|

### Association

- has_many :items
- has_many :orders

## itemsテーブル

| Column | Type | Options |
| --- | --- | --- |
| name（商品名） | string | null: false |
| price（価格） | integer | null: false|
| info（商品の説明） | text | null: false|
| category_id（カテゴリー） | integer | null: false |
| status_id（商品の状態） | integer | null: false |
| shipping_fee_id（配送料の負担） | integer | null: false |
| prefecture_id（配送元の地域） | integer | null: false |
| shipping_date_id（発送日の目安） | integer | null: false |
| user | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :order

## ordersテーブル

| Column | Type | Options |
| --- | --- | --- |
| user | references | null: false, foreign_key: true |
| item | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :address

## addressesテーブル

| Column | Type | Options |
| --- | --- | --- |
| postal_code（郵便番号） | string | null: false |
| prefecture_id（都道府県） | integer | null: false|
| city（市区町村） | string | null: false|
| addresses（番地） | string | null: false |
| building（建物名） | string | |
| phone_number（電話番号） | string | null: false |
| order | references | null: false, foreign_key: true |

### Association

- belongs_to :order