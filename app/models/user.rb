class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i
  VALID_NAME_REGEX = /\A[ぁ-んァ-ン一-龥]+\z/
  VALID_FURIGANA_REGEX = /\A[ァ-ン]+\z/i


  with_options presence: true do
    validates :nickname
    # password_confirmationはログイン項目にないため削除
    # validates :password_confirmation, length: {minimum: 6}, format: {with: VALID_PASSWORD_REGEX}
    validates :family_name, format: {with: VALID_NAME_REGEX}
    validates :given_name, format: {with: VALID_NAME_REGEX}
    validates :family_name_reading, format: {with: VALID_FURIGANA_REGEX}
    validates :given_name_reading, format: {with: VALID_FURIGANA_REGEX}
    validates :birthday
  end

  validates :email, uniqueness: { case_sensitive: true }
  validates :password, format: {with: VALID_PASSWORD_REGEX}

  has_many :items
  has_many :comments
  has_many :purchases

end

