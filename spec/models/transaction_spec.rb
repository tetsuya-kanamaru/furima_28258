require 'rails_helper'

RSpec.describe Transaction, type: :model do
  describe '#create' do
    before do
      @transaction = FactoryBot.build(:transaction)
    end

    it "全ての項目が存在すれば登録できること" do
      expect(@transaction).to be_valid
    end

    it "postal_codeが空では登録できないこと" do
      @transaction.postal_code = nil
      @transaction.valid?
      expect(@transaction.errors.full_messages).to include("Postal code can't be blank")
    end

    it "postal_codeがハイフン無しでは登録できないこと" do
      @transaction.postal_code = '1234567'
      @transaction.valid?
      expect(@transaction.errors.full_messages).to include("Postal code is invalid")
    end

    it "postal_codeの前半が3桁未満、後半が4桁未満だと登録できないこと" do
      @transaction.postal_code = '12-345'
      @transaction.valid?
      expect(@transaction.errors.full_messages).to include("Postal code is invalid")
    end

    it "postal_codeの前半が4桁以上、後半が5桁以上だと登録できないこと" do
      @transaction.postal_code = '1234-56789'
      @transaction.valid?
      expect(@transaction.errors.full_messages).to include("Postal code is invalid")
    end

    it "postal_codeが数字以外だと登録できないこと" do
      @transaction.postal_code = '一二三-四五六七'
      @transaction.valid?
      expect(@transaction.errors.full_messages).to include("Postal code is invalid")
    end


    it "prefecture_idが空では登録できないこと" do
      @transaction.prefecture_id = nil
      @transaction.valid?
      expect(@transaction.errors.full_messages).to include("Prefecture can't be blank")
    end

    it "cityが空では登録できないこと" do
      @transaction.city = nil
      @transaction.valid?
      expect(@transaction.errors.full_messages).to include("City can't be blank")
    end

    it "house_numberが空では登録できないこと" do
      @transaction.house_number = nil
      @transaction.valid?
      expect(@transaction.errors.full_messages).to include("House number can't be blank")
    end

    it "phone_numberが空では登録できないこと" do
      @transaction.phone_number = nil
      @transaction.valid?
      expect(@transaction.errors.full_messages).to include("Phone number can't be blank")
    end

    it "phone_numberが9桁以下だと登録できないこと" do
      @transaction.phone_number = '090123456'
      @transaction.valid?
      expect(@transaction.errors.full_messages).to include("Phone number is invalid")
    end

    it "phone_numberが12桁以下だと登録できないこと" do
      @transaction.phone_number = '090123456789'
      @transaction.valid?
      expect(@transaction.errors.full_messages).to include("Phone number is invalid")
    end
  end
end

