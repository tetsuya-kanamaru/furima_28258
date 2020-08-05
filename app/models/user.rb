class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
    validates :nickname
    validates :email
    validates :password
    validates :password_confirmation
    validates :family_name
    validates :given_name
    validates :family_name_reading
    validates :given_name_reading
    validates :birthday
  end

  validates :email, inclusion: {in: ['@']},
                    uniqueness: true

  with_options length: {minimum: 6, message: 'パスワードは６文字以上を入力してください'},format: {with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i, message: 'パスワードは半角英数字を含めて入力してください' do
    validates :password
    validates :password_confirmation
  end

  with_options format: {with: /\A[ぁ-んァ-ン一-龥]+\z/, message: '全角ひらがな、またはカタカナ、または漢字で入力してください'} do
    validates :family_name
    validates :given_name
  end

  with_options format: {with: /\A[ァ-ヶー－]+\z/, message: '全角カタカナで入力してください'}
  validates :family_name_reading
  validates :given_name_reading

end

  validates :nickname, format: { with: /\A[a-z0-9]+\z/i, message: "is invalid. Input half-width characters."}

