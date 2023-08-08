require 'rails_helper'

RSpec.describe OrderForm, type: :model do
  describe '商品購入機能' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      @order = FactoryBot.build(:order_form, user_id: user.id, item_id: item.id)
      sleep(0.01)
    end

    context '商品購入ができる場合' do
      it '入力情報が十分' do
        expect(@order).to be_valid
      end
      it '建物名が空でも可能' do
        @order.building = ''
        @order.valid?
        expect(@order).to be_valid
      end
    end

    context '商品購入ができない場合' do
      it '郵便番号が必須' do
        @order.postal_code = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("Postal code can't be blank")
      end
      it '郵便番号は、「3桁ハイフン4桁」の半角文字列のみ保存可能なこと' do
        @order.postal_code = '1234567'
        @order.valid?
        expect(@order.errors.full_messages).to include('Postal code is invalid. Include hyphen(-)')
      end
      it '郵便番号は半角文字列のみ保存可能なこと' do
        @order.postal_code = '１２３４５６７'
        @order.valid?
        expect(@order.errors.full_messages).to include('Postal code is invalid. Include hyphen(-)')
      end
      it '都道府県が必須' do
        @order.prefecture_id = '1'
        @order.valid?
        expect(@order.errors.full_messages).to include("Prefecture can't be blank")
      end
      it '市区町村が必須' do
        @order.city = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("City can't be blank")
      end
      it '番地が必須' do
        @order.house_number = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("House number can't be blank")
      end
      it '電話番号が必須' do
        @order.phone_number = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("Phone number can't be blank")
      end
      it '電話番号は、10桁以上11桁以内の半角数値のみ保存可能' do
        @order.phone_number = '090-1234-5678'
        @order.valid?
        expect(@order.errors.full_messages).to include("Phone number is invalid")
      end
      it '電話番号は10桁以下では保存不可能' do
        @order.phone_number = '000111222'
        @order.valid?
        expect(@order.errors.full_messages).to include("Phone number is invalid")
      end
      it '電話番号は11桁以上では保存不可能' do
        @order.phone_number = '0001111222233'
        @order.valid?
        expect(@order.errors.full_messages).to include("Phone number is invalid")
      end
      it '電話番号は半角数値のみ保存可能' do
        @order.phone_number = '０００１１１１２２２２'
        @order.valid?
        expect(@order.errors.full_messages).to include("Phone number is invalid")
      end
      it 'token情報が必須' do
        @order.token = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("Token can't be blank")
      end
      it 'user_id情報が必須' do
        @order.user_id = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("User can't be blank")
      end
      it 'item_id情報が必須' do
        @order.item_id = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end
