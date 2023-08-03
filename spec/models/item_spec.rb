require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品機能' do
    context '必要な情報を適切に入力されている' do
      it '入力情報が十分' do
        expect(@item).to be_valid
      end
    end

    context '必要な情報を適切に入力されていない' do
      it '商品画像を1枚つけることが必須' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it '商品名が必須' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it '商品の説明が必須' do
        @item.info = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Info can't be blank")
      end
      it 'カテゴリーの情報が必須（---だと不可）' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it '商品の状態の情報が必須（---だと不可）' do
        @item.status_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Status can't be blank")
      end
      it '配送料の負担の情報が必須（---だと不可）' do
        @item.shipping_fee_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping fee can't be blank")
      end
      it '発送元の地域の情報が必須（---だと不可）' do
        @item.prefecture_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank")
      end
      it '発送までの日数の情報が必須（---だと不可）' do
        @item.shipping_date_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping date can't be blank")
      end
      it '価格の情報が必須' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it '価格は300未満では保存不可能' do
        @item.price = 200
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be in 300..9999999')
      end
      it '価格は10000000以上では保存不可能' do
        @item.price = 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be in 300..9999999')
      end
      it '価格は半角数値のみ保存可能' do
        @item.price = '１０００'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not a number')
      end

      
    end
  end
end