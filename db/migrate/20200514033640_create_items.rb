class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :name, null: false
      t.text :description, null: false
      t.integer :price, null: false
      t.string :brand
      t.integer :condition_id, null: false
      t.integer :size_id
      t.integer :delivery_charge_id, null: false
      t.integer :delivery_day_id, null: false
      t.integer :delivery_way_id
      t.integer :area_id, null: false
      t.integer :category_id, null: false
      t.timestamps
    end
  end
end