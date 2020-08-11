require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '#create' do
    before do
      @item = FactoryBot.build(:item)
      @item.image = fixture_file_upload('app/assets/images/furima-header01.png')
    end

    it "全ての項目が存在すれば登録できること" do
      expect(@item).to be_valid
    end

    it "imageが空では登録できないこと" do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Image can't be blank")
    end

    it "nameが空では登録できないこと" do
      @item.name = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Name can't be blank")
    end

    it "item_descriptionが空では登録できないこと" do
      @item.item_description = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Item description can't be blank")
    end

    it "category_idが空では登録できないこと" do
      @item.category_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Category can't be blank")
    end

    it "item_conditon_idが空では登録できないこと" do
      @item.item_condition_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Item condition can't be blank")
    end

    it "shipping_fee_idが空では登録できないこと" do
      @item.shipping_fee_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Shipping fee can't be blank")
    end

    it "shipping_place_idが空では登録できないこと" do
      @item.shipping_place_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Shipping place can't be blank")
    end

    it "shipping_days_idが空では登録できないこと" do
      @item.shipping_days_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Shipping days can't be blank")
    end

    it "priceが空では登録できないこと" do
      @item.price = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank")
    end

    it 'priceが数字以外では保存できないこと' do
      @item.price = 'あああ'
      @item.valid?
      expect(@item.errors.full_messages).to include('Price is not a number')
    end

    it 'priceが300未満のときに保存できないこと' do
      @item.price = 299
      @item.valid?
      expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
    end

    it 'priceが9999999より大きいときに保存できないこと' do
      @item.price = 100000000
      @item.valid?
      binding.pry
      expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999")
    end
       
  end

end
