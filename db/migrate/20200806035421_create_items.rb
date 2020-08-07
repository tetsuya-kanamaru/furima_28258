class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.references :user, null: false, foreign_key: true
      t.text :image, null: false
      t.string :name, null: false
      t.text :item_description, null: false
      t.integer :category, null: false
      t.integer :item_condition, null: false
      t.integer :shipping_fee, null: false
      t.integer :shipping_place, null: false
      t.integer :shipping_days, null: false
      t.integer :price, null: false
      t.timestamps
    end
  end
end
