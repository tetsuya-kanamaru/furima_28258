class Item < ApplicationRecord

with options precense: true do
  validates :image
  validates :name
  validates :item_description
  validates :category
  validates :item_condition
  validates :shipping_fee
  validates :shipping_place
  validates :shipping_days
  validates :price
end

belongs_to :user
has_many :comments
has_one :address
has_one :purchase

end
