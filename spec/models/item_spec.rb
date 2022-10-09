require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '商品新規登録' do
    before do
      @item = FactoryBot.build(:item)
    end

    context '内容に問題がない時' do
      it '全ての値が正しく入力されていれば保存できる' do
        expect(@item).to be_valid
      end
    end

    context '内容に問題がある時' do
      it 'imageが空では保存できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it 'nameが空では保存できない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it 'descriptionが空では保存できない' do
        @item.description = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Description can't be blank")
      end
      it 'category_idが0では保存できない' do
        @item.category_id = '0'
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it 'condition_idが0では保存できない' do
        @item.condition_id = '0'
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition can't be blank")
      end
      it 'shipping_idが0では保存できない' do
        @item.shipping_id = '0'
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping can't be blank")
      end
      it 'prefecture_idが0では保存できない' do
        @item.prefecture_id = '0'
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'days_to_ship_idが0では保存できない' do
        @item.days_to_ship_id = '0'
        @item.valid?
        expect(@item.errors.full_messages).to include("Days to ship can't be blank")
      end
      it 'priceが空では保存できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it '299以下のpriceは保存できない' do
        @item.price = '299'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is out of setting range')
      end
      it '10,000,000以上のpriceは保存できない' do
        @item.price = '10000000'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is out of setting range')
      end
      it '半角英字のpriceは保存できない' do
        @item.price = 'aaa'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is invalid. Input half-width characters')
      end
      it '全角数字のpriceは保存できない' do
        @item.price = '３００'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is invalid. Input half-width characters')
      end
    end
  end
end
