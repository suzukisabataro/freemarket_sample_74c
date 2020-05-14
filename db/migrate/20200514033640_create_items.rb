class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :name, null: false
      t.text :description, null: false
      t.integer :price, null: false
      t.string :brand
      t.integer :condition, null: false
      t.integer :size, null: false
      t.integer :delivery_charge, null: false
      t.integer :delivery_days, null: false
      t.integer :delivery_ways, null: false
      t.integer :area, null: false
      t.integer :category, null: false
      t.integer :category1
      t.integer :category2
      t.timestamps
    end
  end
end