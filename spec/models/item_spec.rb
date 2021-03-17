require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '#create' do
    before do
      @item = FactoryBot.build(:item)
    end

    describe '商品新規投稿' do
      
      context '商品の新規投稿ができる時' do
        
        it "全ての項目を入力すれば投稿できる" do
          expect(@item).to be_valid
        end
      
      end

      context '商品の新規投稿ができない時' do
        
        it "nameが空では投稿できないこと" do
          @item.name = ''
          @item.valid?
          expect(@item.errors.full_messages).to include("Name can't be blank")
        end

        it "imageが空では投稿できないこと" do
          @item.image = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Image can't be blank")
        end

        it "descriptionが空では投稿できないこと" do
          @item.description = ''
          @item.valid?
          expect(@item.errors.full_messages).to include("Description can't be blank")
        end

        it "category_idが空では投稿できないこと" do
          @item.category_id = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Category is not a number")
        end

        it "category_idが1では投稿できないこと" do
          @item.category_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include("Category must be other than 1")
        end

        it "status_idが空では投稿できないこと" do
          @item.status_id = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Status is not a number")
        end

        it "status_idが1では投稿できないこと" do
          @item.status_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include("Status must be other than 1")
        end

        it "delivery_idが空では投稿できないこと" do
          @item.delivery_id = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Delivery is not a number")
        end

        it "delivery_idが1では投稿できないこと" do
          @item.delivery_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include("Delivery must be other than 1")
        end

        it "state_idが空では投稿できないこと" do
          @item.state_id = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("State is not a number")
        end

        it "state_idが1では投稿できないこと" do
          @item.state_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include("State must be other than 1")
        end

        it "delivery_day_idが空では投稿できないこと" do
          @item.delivery_day_id = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Delivery day is not a number")
        end

        it "delivery_day_idが1では投稿できないこと" do
          @item.delivery_day_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include("Delivery day must be other than 1")
        end

        it "valueが空では投稿できないこと" do
          @item.value = ''
          @item.valid?
          expect(@item.errors.full_messages).to include("Value can't be blank")
        end

        it "valueが300より小さければ投稿できないこと" do
          @item.value = 299
          @item.valid?
          expect(@item.errors.full_messages).to include("Value is not included in the list")
        end

        it "valueが9,999,999より大きければ投稿できないこと" do
          @item.value = 10000000
          @item.valid?
          expect(@item.errors.full_messages).to include("Value is not included in the list")
        end

        it "valueは半角数字でなけれな投稿できないこと" do
          @item.value = '３００'
          @item.valid?
          expect(@item.errors.full_messages).to include("Value is not included in the list")
        end

        it 'ユーザーが紐付いていなければ投稿できない' do
          @item.user = nil
          @item.valid?
          expect(@item.errors.full_messages).to include('User must exist')
        end

      end
    end
  end
end
