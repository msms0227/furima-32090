require 'rails_helper'
RSpec.describe UserBuyRecord, type: :model do
  before do
    @user_buy_record = FactoryBot.build(:user_buy_record)
  end
  describe '商品購入' do
    context '商品が購入できる時' do
      it '入力項目を全て記入すれば登録できる' do
        expect(@user_buy_record).to be_valid
      end
    end

    context '商品出品がうまくいかないとき' do
      it 'nameが空ではいけない' do
        @user_buy_record.name = ''
        @user_buy_record.valid?
        expect(@user_buy_record.errors.full_messages).to include("Name can't be blank")
      end

      it 'imageが空ではいけない' do
        @user_buy_record.image = nil
        @user_buy_record.valid?
        expect(@user_buy_record.errors.full_messages).to include("Image can't be blank")
      end

      it 'dataが空ではいけない' do
        @user_buy_record.data = ''
        @user_buy_record.valid?
        expect(@user_buy_record.errors.full_messages).to include("Data can't be blank")
      end

      it 'category_idが空ではいけない' do
        @user_buy_record.category_id = ''
        @user_buy_record.valid?
        expect(@user_buy_record.errors.full_messages).to include("Category can't be blank")
      end

      it 'category_idが1ではいけない' do
        @user_buy_record.category_id = '1'
        @user_buy_record.valid?
        expect(@user_buy_record.errors.full_messages).to include('Category must be other than 1')
      end

      it 'status_idが空ではいけない' do
        @user_buy_record.status_id = ''
        @user_buy_record.valid?
        expect(@user_buy_record.errors.full_messages).to include("Status can't be blank")
      end

      it 'status_idが1ではいけない' do
        @user_buy_record.status_id = '1'
        @user_buy_record.valid?
        expect(@user_buy_record.errors.full_messages).to include('Status must be other than 1')
      end

      it 'delivery_fee_idが空ではいけない' do
        @user_buy_record.delivery_fee_id = ''
        @user_buy_record.valid?
        expect(@user_buy_record.errors.full_messages).to include("Delivery fee can't be blank")
      end

      it 'delivery_fee_idが1ではいけない' do
        @user_buy_record.delivery_fee_id = '1'
        @user_buy_record.valid?
        expect(@user_buy_record.errors.full_messages).to include('Delivery fee must be other than 1')
      end

      it 'area_idが空ではいけない' do
        @user_buy_record.area_id = ''
        @user_buy_record.valid?
        expect(@user_buy_record.errors.full_messages).to include("Area can't be blank")
      end

      it 'area_idが1ではいけない' do
        @user_buy_record.area_id = '1'
        @user_buy_record.valid?
        expect(@user_buy_record.errors.full_messages).to include('Area must be other than 1')
      end

      it 'day_idが空ではいけない' do
        @user_buy_record.day_id = ''
        @user_buy_record.valid?
        expect(@user_buy_record.errors.full_messages).to include("Day can't be blank")
      end

      it 'day_idが1ではいけない' do
        @user_buy_record.day_id = '1'
        @user_buy_record.valid?
        expect(@user_buy_record.errors.full_messages).to include('Day must be other than 1')
      end

      it 'priceが空ではいけない' do
        @user_buy_record.price = ''
        @user_buy_record.valid?
        expect(@user_buy_record.errors.full_messages).to include("Price can't be blank")
      end

      it 'priceが300以上でなければいけない' do
        @user_buy_record.price = '299'
        @user_buy_record.valid?
        expect(@user_buy_record.errors.full_messages).to include('Price 300円以上で入力して下さい')
      end

      it 'priceが9999999以下でなければいけない' do
        @user_buy_record.price = '10000000'
        @user_buy_record.valid?
        expect(@user_buy_record.errors.full_messages).to include('Price 9999999以下で入力して下さい')
      end
      it 'priceが全角ではいけない' do
        @user_buy_record.price = 'ああ'
        @user_buy_record.valid?
        expect(@user_buy_record.errors.full_messages).to include('Price 300円以上で入力して下さい', 'Price 9999999以下で入力して下さい')
      end

      it 'priceが英数混合ではいけない' do
        @user_buy_record.price = 'abc123'
        @user_buy_record.valid?
        expect(@user_buy_record.errors.full_messages).to include('Price 300円以上で入力して下さい', 'Price 9999999以下で入力して下さい')
      end

      it 'priceが半角英数ではいけない' do
        @user_buy_record.price = 'aaaaa'
        @user_buy_record.valid?
        expect(@user_buy_record.errors.full_messages).to include('Price 300円以上で入力して下さい', 'Price 9999999以下で入力して下さい')
      end
    end
  end
end
