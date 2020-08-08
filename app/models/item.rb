class Item < ApplicationRecord

with_options presence: true do
  validates :image
  validates :name
  validates :item_description
  validates :category
  validates :item_condition
  validates :shipping_fee
  validates :shipping_place
  validates :shipping_days
  validates :price, numericality: {greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999}
end

belongs_to :user
has_many :comments
has_one :address
has_one :purchase

end
