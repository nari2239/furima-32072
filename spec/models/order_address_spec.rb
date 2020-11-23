require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  describe '商品購入の登録' do
    before do
      @order_address = FactoryBot.build(:order_address)
    end

    context '商品購入の登録に成功するとき' do
      it '全ての値が正しく入力されていれば商品購入の登録ができる' do
        expect(@order_address).to be_valid
      end
      it 'building_nameが空でも商品購入の登録ができる' do
        @order_address.building_name = nil
        expect(@order_address).to be_valid
      end
    end

    context '商品購入の登録に失敗するとき' do
      it 'tokenが空だと商品購入の登録ができない' do
        @order_address.token = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Token can't be blank")
      end
      it 'postal_codeが空だと商品購入の登録ができない' do
        @order_address.postal_code = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Postal code can't be blank")
      end
      it 'postal_codeが半角のハイフンを含んでいないと商品購入の登録ができない' do
        @order_address.postal_code = '1234567'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Postal code Input correctly')
      end
      it 'prefecture_idを選択していないと商品購入の登録ができない' do
        @order_address.prefecture_id = 1
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Prefecture Select')
      end
      it 'cityが空だと商品購入の登録ができない' do
        @order_address.city = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("City can't be blank")
      end
      it 'house_numberが空だと商品購入の登録ができない' do
        @order_address.house_number = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("House number can't be blank")
      end
      it 'phone_numberが空だと商品購入の登録ができない' do
        @order_address.phone_number = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number can't be blank")
      end
      it 'phone_numberが全角数字だと商品購入の登録ができない' do
        @order_address.phone_number = '０９０１２３４５６７８'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Phone number Input only number')
      end
      it 'phone_numberが12桁以上だと商品購入の登録ができない' do
        @order_address.phone_number = '090123456789'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number Input only number")
      end
    end
  end
end
