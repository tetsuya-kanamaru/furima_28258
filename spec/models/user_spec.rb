require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#create' do
    before do
      @user = FactoryBot.build(:user)
    end

    it "nickname、email、password、family_name、given_name、family_name_reading、given_name_reading、birthdayが存在し、passwordが６文字以上であれば登録できること" do
      expect(@user).to be_valid
    end

    it "nicknameが空では登録できないこと" do
      @user.nickname = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end

    it "emailが空では登録できないこと" do
      @user.email = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end

    it "passwordが空では登録できないこと" do
      @user.password = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end

    it "family_nameが空では登録できないこと" do
      @user.family_name = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Family name can't be blank")
    end

    it "given_nameが空では登録できないこと" do
      @user.given_name = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Given name can't be blank")
    end

    it "family_name_readingが空では登録できないこと" do
      @user.family_name_reading = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Family name reading can't be blank")
    end

    it "given_name_readingが空では登録できないこと" do
      @user.given_name_reading = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Given name reading can't be blank")
    end

    it "birthdayが空では登録できないこと" do
      @user.birthday = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Birthday can't be blank")
    end
       
    it "重複したemailが存在する場合登録できないこと" do
      @user.save
      another_user = FactoryBot.build(:user, email: @user.email)
      another_user.valid?
      expect(another_user.errors.full_messages).to include("Email has already been taken")
    end

    it "passwordが5文字以下であれば登録できないこと" do
      @user.password = 'aaaaa'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
    end

    it "family_name_readingがカタカナ意外では登録できないこと" do
      @user.family_name_reading = 'ああああ'
      @user.valid?
      expect(@user.errors.full_messages).to include("Family name reading is invalid")
    end

    it "given_name_readingがカタカナ意外では登録できないこと" do
      @user.given_name_reading = 'ああああ'
      @user.valid?
      expect(@user.errors.full_messages).to include("Given name reading is invalid")
    end

  end
end