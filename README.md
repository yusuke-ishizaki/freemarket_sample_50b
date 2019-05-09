## productsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|text|string|null: false|
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
|phone|integer|
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
|family-name-kanji|string|null: false|
|family-name-kana|string|null: false|
|first-name-kanji|string|null: false|
|first-name-kana|string|null: false|
|user_id|integer|
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
|parent-category|integer|null: false|
|child-category|integer|null: false|
|grand-category|integer|null: false|
|size|integer|null: false|
|product_id|integer|
### Association
- has_many :products

## deliveryテーブル
|Column|Type|Options|
|------|----|-------|
|delivery-price|integer|null: false|
|delivery-region|string|null: false|
|delivery-date|integer|null: false|
|delivery-method|string|null: false|
|product_id|integer|
### Association
- belongs_to :product

## adressテーブル
|Column|Type|Options|
|------|----|-------|
|post_code|integer|null: false|
|region|string|null: false|
|city|string|null: false|
|block|string|null: false|
|building|string|
|user_id|reference|null: false|
### Association
- belongs_to :user
