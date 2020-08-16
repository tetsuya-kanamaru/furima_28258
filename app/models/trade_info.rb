class TradeInfo < ApplicationRecord

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture

  VALID_POSTAL_CODE_REGEX = /\A\d{3}-\d{4}\z/
  VALID_CITY_REGEX = /\A[ヶ々ァ-ンぁ-ん一-龥]+\z/
  VALID_HOUSE_NUMBER_REGEX = /\A[−ヶ々ァ-ンぁ-ん一-龥１-９ー\d-]+\z/
  VALID_PHONE_NUMBER_REGEX = /\A\d{10,11}\z/

  with_options presence: true do
    validates :postal_code,   format: {with: VALID_POSTAL_CODE_REGEX}
    validates :prefecture_id
    validates :city,          format: {with: VALID_CITY_REGEX}
    validates :house_number,  format: {with: VALID_HOUSE_NUMBER_REGEX}
    validates :phone_number,  format: {with: VALID_PHONE_NUMBER_REGEX}
  end

  belongs_to :item
  belongs_to :user
  
end
