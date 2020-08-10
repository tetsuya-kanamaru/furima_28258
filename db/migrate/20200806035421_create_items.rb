class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.references :user, null: false, foreign_key: true
      t.text :image, null: false
      t.string :name, null: false
      t.text :item_description, null: false
      t.integer :category_id, null: false
      t.integer :item_condition_id, null: false
      t.integer :shipping_fee_id, null: false
      t.integer :shipping_place_id, null: false
      t.integer :shipping_days_id, null: false
      t.integer :price, null: false
      t.timestamps
    end
  end
end
