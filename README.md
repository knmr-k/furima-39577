# テーブル設計

## usersテーブル

| Column | Type | Options |
| --- | --- | --- |
| email | string | NOT NULL, unique: true|
| encrypted_password | string | NOT NULL|
| nickname（ニックネーム） | string | NOT NULL|
| last_name（名字） | string | NOT NULL |
| first_name（名前） | string | NOT NULL|
| last_name_kana（名字カナ） | string | NOT NULL|
| first_name_kana（名前カナ） | string | NOT NULL|
| birthday（生年月日） | date | NOT NULL|

### Association

- has_many :items
- has_many :orders

## itemsテーブル

| Column | Type | Options |
| --- | --- | --- |
| name（商品名） | string | NOT NULL |
| price（価格） | string | NOT NULL|
| info（商品の説明） | text | NOT NULL|
| category_id（カテゴリー） | integer | NOT NULL |
| status_id（商品の状態） | integer | NOT NULL |
| shipping_fee_id（配送料の負担） | integer | NOT NULL |
| prefectures_id（配送元の地域） | integer | NOT NULL |
| shipping_date_id（発送日の目安） | integer | NOT NULL |
| user | references | NOT NULL, foreign_key: true |

### Association

- belongs_to :user
- has_one :order

## ordersテーブル

| Column | Type | Options |
| --- | --- | --- |
| user | references | NOT NULL, foreign_key: true |
| item | references | NOT NULL, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :address

## addressesテーブル

| Column | Type | Options |
| --- | --- | --- |
| postal_code（郵便番号） | string | NOT NULL |
| prefectures_id（都道府県） | integer | NOT NULL|
| city（市区町村） | string | NOT NULL|
| addresses（番地） | string | NOT NULL |
| building（建物名） | string | |
| phone_number（電話番号） | string | NOT NULL |
| order | references | NOT NULL, foreign_key: true |

### Association

- belongs_to :order