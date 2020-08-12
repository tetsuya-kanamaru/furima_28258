class Address < ApplicationRecord

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture

  with_options precense: true do
    validates :postal_code,   format: {with: /\A\d{3}-\d{4}\z/}
    validates :prefecture_id
    validates :city,          format: {with: /\A[ヶ々ァ-ンぁ-ん一-龥]+\z/}
    validates :house_number,  format: {with: /\A[−ヶ々ァ-ンぁ-ん一-龥１-９ー\d-]+\z/}
    validates :phone_number,  format: {with: /\A\d{10,11}\z/}
  end

  belogns_to :item

end
