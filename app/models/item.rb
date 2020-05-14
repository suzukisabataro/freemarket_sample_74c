class Item < ApplicationRecord
  belongs_to_active_hash :area
  belongs_to_active_hash :category
  belongs_to_active_hash :category1
  belongs_to_active_hash :category2
  belongs_to_active_hash :condition
  belongs_to_active_hash :delivery_charge
  belongs_to_active_hash :delivery_day
  belongs_to_active_hash :size
  has_many :item_images
end
