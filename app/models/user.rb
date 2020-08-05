class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
    validates :nickname
    validates :email, inclusion: {in: ['@']}, uniqueness: true
    validates :password, length: {minimum: 6, message: 'パスワードは６文字以上を入力してください'}, format: {with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i, message: 'パスワードは半角英数字を含めて入力してください'}
    validates :password_confirmation, length: {minimum: 6, message: 'パスワードは６文字以上を入力してください'}, format: {with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i, message: 'パスワードは半角英数字を含めて入力してください'}
    validates :family_name, format: {with: /\A[ぁ-んァ-ン一-龥]+\z/, message: '全角ひらがな、カタカナ、または漢字で入力してください'}
    validates :given_name, format: {with: /\A[ぁ-んァ-ン一-龥]+\z/, message: '全角ひらがな、カタカナ、または漢字で入力してください'}
    validates :family_name_reading, format: {with: /\A[ァ-ヶー－]+\z/, message: '全角カタカナで入力してください'}
    validates :given_name_reading, format: {with: /\A[ァ-ヶー－]+\z/, message: '全角カタカナで入力してください'}
    validates :birthday
  end
end
