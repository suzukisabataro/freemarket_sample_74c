## ER図
[![Image from Gyazo](https://i.gyazo.com/907ad06f26dca32fbcd159a8c7c32bcf.png)](https://gyazo.com/907ad06f26dca32fbcd159a8c7c32bcf)
# freemarket_sample_74b

# フリマアプリのクローンサイト。
[![Image from Gyazo](https://i.gyazo.com/3a529b3b823c297193c66262227cf2dc.gif)](https://gyazo.com/3a529b3b823c297193c66262227cf2dc)

# フリマアプリ訪問
URL: http://46.51.232.119//

ID: teamb

Pass: bbbb

 購入用アカウント: sell@gmail.com

 出品用アカウント: buy@gmail.com

 パスワード: 1234567


## Usersテーブル
|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false|
|email|string|null: false|
|password|string|null: false|
|image|string||
|family_name|string|null: false|
|first_name|string|null: false|
|family_name_kana|string|null: false|
|first_name_kana|string|null: false|
|birth_day_yy|integer|null: false|
|birth_day_mm|integer|null: false|
|birth_day_dd|integer|null: false|
|introduuction|text||
|phone_number|integer|null: false|

### Association
- belongs_to_active_hash :birth_day_yy
- belongs_to_active_hash :birth_day_mm
- belongs_to_active_hash :birth_day_dd
- belongs_to_active_hash :prefecture
- has_many :items
- has_many :comments
- has_one :credit_card, (pay.ja使用)
- has_one :address

## Addressテーブル
|Column|Type|Options|
|------|----|-------|
|postal_code|intager|null: false|
|prefecture|integer|null: false|
|city|string|null: false|
|address1（番地）|string|null: false|
|building_name|string|
|user_id|refarences|null: false, foreign_key: true|
### Association
- belongs_to :user

## Credit_cardsテーブル(pay.ja使用)
|Column|Type|Options|
|------|----|-------|
|costomer_id|intager|null: false|
|cord_id|intager|null: false|
|user_id|refarences|null: false, foreign_key: true|
### Association
- belongs_to :user

## Commentsテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|refarences|null: false, foreign_key: true|
|items_id|refarences|null: false, foreign_key: true|
|commtnt|text|null: false|

### Association
- belongs_to :user
- belongs_to :item

## Likesテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|refarences|null: false, foreign_key: true|
|item_id|refarences|null: false, foreign_key: true|
### Association
- belongs_to :user
- belongs_to :item

## Itemsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|description|text|null: false|
|price|integer|null: false|
|brand_id|refarences|foreign_key: true|
|item_condition_id(商品状態)|reference|null: false, foreign_key: true|
|size_id|refarences|null: false|
|delivery_charge|references|null: false, foreign_key: true|
|delivery_day_id|references|null: false, foreign_key: true|
|delivery_way_id|references|null: false, foreign_key: true|
|prefecture_id|references|null: false, foreign_key: true|
|category_id|references|null: false, foreign_key: true|
|user_id|references|null: false, foreign_key: true|

### Association
- belongs_to_active_hash :item_condition
- belongs_to_active_hash :delivery_charge
- belongs_to_active_hash :delivery_day
- belongs_to_active_hash :delivery_way
- belongs_to_active_hash :delivery_way
- belongs_to_active_hash :prefecture
- belongs_to_active_hash :size
- belongs_to :categories
- belongs_to : brand
- has_many :images
- belongs_to :user
- add_index :items, :name

## Brandsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
### Association
- has_many :items

## categoriesテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|ancestry|null: false|
### Association
- has_many :items
- has_ancestry

## Item_imagesテーブル
|Column|Type|Options|
|------|----|-------|
|item_id|references|null: false, foreign_key: true|
|item_images|string|null: false|
### Association
- belongs_to :item