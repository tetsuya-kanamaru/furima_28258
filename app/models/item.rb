class Item < ApplicationRecord

with_options presence: true do
  validates :image
  validates :name
  validates :item_description
  validates :category_id
  validates :item_condition_id
  validates :shipping_fee_id
  validates :shipping_place_id
  validates :shipping_days_id
  validates :price, numericality: {greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999}
end

belongs_to :user
has_many :comments
has_one :address
has_one :purchase
has_one_attached :image

end
