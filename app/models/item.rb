class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :area
  belongs_to_active_hash :condition
  belongs_to_active_hash :delivery_charge
  belongs_to_active_hash :delivery_day
  belongs_to_active_hash :delivery_way
  belongs_to_active_hash :condition
  # has_many :item_images
  has_many :item_images, dependent: :destroy
  validates :item_images,          presence: true
  validates :name,                presence: true
  validates :description,         presence: true, length: { maximum: 1000 }
  validates :price,               presence: true, numericality:	{minimum:300,maximum:9999999}
  validates :condition_id,        presence: true
  validates :delivery_charge_id,  presence: true
  validates :delivery_day_id,     presence: true
  validates :area_id,             presence: true
  validates :category_id,         presence: true
  accepts_nested_attributes_for :item_images,allow_destroy: true
  belongs_to :user
  belongs_to :category
  has_many :item_images
end
