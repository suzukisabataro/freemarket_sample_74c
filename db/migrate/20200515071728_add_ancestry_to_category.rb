class AddAncestryToCategory < ActiveRecord::Migration[5.2]
  def change
    add_column :categories, :ancestry, :string
    add_index :categories, :ancestry
    # ancestry ではカラム同士を結びつけるキーがinteger型ではなくstring型なことに注意。
    # ancestryでは親要素の子要素の子要素という複雑な構造を再現するために（1/2）のようなカラムの内容になるためstring型での指定となっている。(intger型で/は認識されないから)
    # またindexというのはカテゴリー別に商品を検索して表示したい場合などに検索を高速化したいためこのカラムに貼っている。
  end
end
