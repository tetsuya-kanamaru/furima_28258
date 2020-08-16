require 'rails_helper'

RSpec.describe TradeInfo, type: :model do
  describe '#create' do
    before do
      @trade = FactoryBot.build(:trade_info)
    end

    it "全ての項目が存在すれば登録できること" do
      expect(@trade).to be_valid
    end

    it "postal_codeが[3桁-4桁]であれば登録できること" do
      @trade.postal_code = '123-4567'
      @trade.valid?
      expect(@trade.postal_code).to be_valid
    end

    it "postal_codeが空では登録できないこと" do
      @trade.postal_code = nil
      @trade.valid?
      expect(@trade.errors.full_messages).to include("Postal code can't be blank")
    end

    it "postal_codeが[3桁-4桁]以外では登録できないこと" do
      @trade.postal_code = '12-34567'
      @trade.valid?
      expect(@trade.errors.full_messages).to include("Postal code is invalid")
    end


    it "prefecture_idが空では登録できないこと" do
      @trade.prefecture_id = nil
      @trade.valid?
      expect(@trade.errors.full_messages).to include("Prefecture can't be blank")
    end

    it "cityが空では登録できないこと" do
      @trade.city = nil
      @trade.valid?
      expect(@trade.errors.full_messages).to include("City can't be blank")
    end

    it "cityが英語では登録できないこと" do
      @trade.city = 'Abcde Fghijk'
      @trade.valid?
      expect(@trade.errors.full_messages).to include("City is invalid")
    end

    it "house_numberが空では登録できないこと" do
      @trade.house_number = nil
      @trade.valid?
      expect(@trade.errors.full_messages).to include("House number can't be blank")
    end

    it "house_numberが英語では登録できないこと" do
      @trade.house_number = 'Abcde Fghijk'
      @trade.valid?
      expect(@trade.errors.full_messages).to include("House number is invalid")
    end

    it "phone_numberが11桁であれば登録できること" do
      @trade.phone_number = '09012345678'
      @trade.valid?
      expect(@trade).to be_valid
    end

    it "phone_numberが空では登録できないこと" do
      @trade.phone_number = nil
      @trade.valid?
      expect(@trade.errors.full_messages).to include("Phone number can't be blank")
    end

    it "phone_numberが9桁以下では登録できないこと" do
      @trade.phone_number = '090123456'
      @trade.valid?
      expect(@trade.errors.full_messages).to include("Phone number is invalid")
    end

    it "phone_numberが12桁以上では登録できないこと" do
      @trade.phone_number = '090123456789'
      @trade.valid?
      expect(@trade.errors.full_messages).to include("Phone number is invalid")
    end
       
  end
end
