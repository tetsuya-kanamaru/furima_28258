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
has_one :deal, class_name: 'Transaction'
has_one_attached :image

extend ActiveHash::Associations::ActiveRecordExtensions
belongs_to_active_hash :category
belongs_to_active_hash :item_condition
belongs_to_active_hash :shipping_fee
belongs_to_active_hash :shipping_place
belongs_to_active_hash :shipping_days

end
