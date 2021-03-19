require 'rails_helper'

RSpec.describe BuyOrder, type: :model do
  describe '商品購入情報の保存' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      @buy_order = FactoryBot.build(:buy_order, user_id: user.id, item_id: item.id)
      sleep 0.1
    end

    context '商品の購入ができる時' do

      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@buy_order).to be_valid
      end

      it 'room_numberは空でも保存できること' do
        @buy_order.room_number = ''
        expect(@buy_order).to be_valid
      end

    end

    context '商品の購入ができない時' do

      it 'zip_codeが空だと保存できないこと' do
        @buy_order.zip_code = ''
        @buy_order.valid?
        expect(@buy_order.errors.full_messages).to include("Zip code can't be blank")
      end

      it 'zip_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
        @buy_order.zip_code = '1234567'
        @buy_order.valid?
        expect(@buy_order.errors.full_messages).to include('Zip code is invalid. Include hyphen(-)')
      end
    
      it 'stateが空だと保存できないこと' do
        @buy_order.state = nil
        @buy_order.valid?
        expect(@buy_order.errors.full_messages).to include("State is not a number")
      end

      it "stateが1では保存できないこと" do
        @buy_order.state = 1
        @buy_order.valid?
        expect(@buy_order.errors.full_messages).to include("State must be other than 1")
      end

      it 'cityが空だと保存できないこと' do
        @buy_order.city = ''
        @buy_order.valid?
        expect(@buy_order.errors.full_messages).to include("City can't be blank")
      end

      it 'house_numberが空だと保存できないこと' do
        @buy_order.house_number = ''
        @buy_order.valid?
        expect(@buy_order.errors.full_messages).to include("House number can't be blank")
      end

      it 'phone_numberが空だと保存できないこと' do
        @buy_order.phone_number = ''
        @buy_order.valid?
        expect(@buy_order.errors.full_messages).to include("Phone number can't be blank")
      end

      it 'phone_numberが11桁より多いと保存できないこと' do
        @buy_order.phone_number = '000000000000'
        @buy_order.valid?
        expect(@buy_order.errors.full_messages).to include("Phone number is too long (maximum is 11 characters)")
      end

      it 'phone_numberは英数混合では保存できないこと' do
        @buy_order.phone_number = '080abcd1234'
        @buy_order.valid?
        expect(@buy_order.errors.full_messages).to include("Phone number is invalid")
      end

      it 'tokenが空だと保存できないこと' do
        @buy_order.token = ''
        @buy_order.valid?
        expect(@buy_order.errors.full_messages).to include("Token can't be blank")
      end

      it 'user_idが空だと保存できないこと' do
        @buy_order.user_id = nil
        @buy_order.valid?
        expect(@buy_order.errors.full_messages).to include("User can't be blank")
      end

      it 'item_idが空だと保存できないこと' do
        @buy_order.item_id = nil
        @buy_order.valid?
        expect(@buy_order.errors.full_messages).to include("Item can't be blank")
      end

    end

  end
end
