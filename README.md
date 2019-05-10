## productsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|text|text|null: false|
|price|integer|null: false|
|status|integer|null: false|
### Association
- belongs_to :user
- belongs_to :bland
- has_one :delivery, dependent: :destroy
- belongs_to :category

## usersテーブル
|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false|
|email|string|null: false, unique: true|
|password|string|null: false|
|phone_number|integer|
|birth_year|integer|null: false|
|birth_month|integer|null: false|
|birth_day|integer|null: false|
### Association
- has_many :products, dependent: :destroy
- has_one :name, dependent: :destroy
- has_one :adress, dependent: :destroy

## nameテーブル
|Column|Type|Options|
|------|----|-------|
|family_name|string|null: false|
|family_name_kana|string|null: false|
|first_name|string|null: false|
|first_name_kana|string|null: false|
|user_id|references|null: false,foreign_key: true|
### Association
- belongs_to :user

## blandテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
### Association
- has_many :products

## categoryテーブル
|Column|Type|Options|
|------|----|-------|
|parent|integer|null: false|
|child|integer|null: false|
|grand|integer|null: false|
|size|integer|null: false|
|product_id|integer|null: false,foreign_key: true|
### Association
- has_many :products

## deliveryテーブル
|Column|Type|Options|
|------|----|-------|
|price|integer|null: false|
|region|string|null: false|
|date|string|null: false|
|method|string|null: false|
|product_id|references|null: false,foreign_key: true|
### Association
- belongs_to :product

## addressテーブル
|Column|Type|Options|
|------|----|-------|
|post_code|integer|null: false|
|region|string|null: false|
|city|string|null: false|
|block|string|null: false|
|building|string|
|user_id|references|null: false, foreign_key: true|
### Association
- belongs_to :user
