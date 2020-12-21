require 'rails_helper'
RSpec.describe UserBuyRecord, type: :model do
  before do
    @user_buy_record = FactoryBot.build(:user_buy_record)
  end
  describe '商品購入' do
    context '商品が購入できる時' do
      it '入力項目を全て記入すれば購入できる' do
        expect(@user_buy_record).to be_valid
      end

      it 'building_nameは空でも保存できる' do
        @user_buy_record.building_name = ''
        expect(@user_buy_record).to be_valid
      end
    end

    context '商品購入がうまくいかないとき' do
      it 'postal_codeが空ではいけない' do
        @user_buy_record.postal_code = ''
        @user_buy_record.valid?
        expect(@user_buy_record.errors.full_messages).to include("Postal code can't be blank")
      end

      it 'postal_codeにハイフンが必要' do
        @user_buy_record.postal_code = '12345678'
        @user_buy_record.valid?
        expect(@user_buy_record.errors.full_messages).to include('Postal code is invalid')
      end

      it 'area_idが空ではいけない' do
        @user_buy_record.area_id = ''
        @user_buy_record.valid?
        expect(@user_buy_record.errors.full_messages).to include("Area can't be blank")
      end

      it 'area_idが〜ではいけない' do
        @user_buy_record.area_id = '1'
        @user_buy_record.valid?
        expect(@user_buy_record.errors.full_messages).to include('Area must be other than 1')
      end

      it 'cityが空ではいけない' do
        @user_buy_record.city = ''
        @user_buy_record.valid?
        expect(@user_buy_record.errors.full_messages).to include("City can't be blank")
      end

      it 'addressが空ではいけない' do
        @user_buy_record.address = ''
        @user_buy_record.valid?
        expect(@user_buy_record.errors.full_messages).to include("Address can't be blank")
      end

      it 'phone_numberが空ではいけない' do
        @user_buy_record.phone_number = ''
        @user_buy_record.valid?
        expect(@user_buy_record.errors.full_messages).to include("Phone number can't be blank")
      end

      it 'phone_numberが半角数字のみでないといけない' do
        @user_buy_record.phone_number = 'あいうえお'
        @user_buy_record.valid?
        expect(@user_buy_record.errors.full_messages).to include('Phone number is invalid')
      end

      it 'phone_numberが英数混合ではいけない' do
        @user_buy_record.phone_number = 'uunc74ndjd'
        @user_buy_record.valid?
        expect(@user_buy_record.errors.full_messages).to include('Phone number is invalid')
      end

      it 'phone_numberが11字以上ではいけない' do
        @user_buy_record.phone_number = '123456789098'
        @user_buy_record.valid?
        expect(@user_buy_record.errors.full_messages).to include('Phone number is too long (maximum is 11 characters)')
      end

      it 'tokenが空ではいけない' do
        @user_buy_record.token = ''
        @user_buy_record.valid?
        expect(@user_buy_record.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end
