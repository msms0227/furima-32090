require 'rails_helper'
RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end
  describe '新規登録' do
    context '商品出品がうまくいくとき' do
      it '入力項目を全て記入すれば登録できる' do
        expect(@item).to be_valid
      end
    end

    context '商品出品がうまくいかないとき' do
      it 'nameが空ではいけない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end

      it 'imageが空ではいけない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end

      it 'dataが空ではいけない' do
        @item.data = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Data can't be blank")
      end

      it 'category_idが空ではいけない' do
        @item.category_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end

      it 'category_idが1ではいけない' do
        @item.category_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include('Category must be other than 1')
      end

      it 'status_idが空ではいけない' do
        @item.status_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Status can't be blank")
      end

      it 'status_idが1ではいけない' do
        @item.status_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include('Status must be other than 1')
      end

      it 'delivery_fee_idが空ではいけない' do
        @item.delivery_fee_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery fee can't be blank")
      end

      it 'delivery_fee_idが1ではいけない' do
        @item.delivery_fee_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include('Delivery fee must be other than 1')
      end

      it 'area_idが空ではいけない' do
        @item.area_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Area can't be blank")
      end

      it 'area_idが1ではいけない' do
        @item.area_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include('Area must be other than 1')
      end

      it 'day_idが空ではいけない' do
        @item.day_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Day can't be blank")
      end

      it 'day_idが1ではいけない' do
        @item.day_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include('Day must be other than 1')
      end

      it 'priceが空ではいけない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end

      it 'priceが300以上でなければいけない' do
        @item.price = '299'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price 300円以上で入力して下さい')
      end

      it 'priceが9999999以下でなければいけない' do
        @item.price = '10000000'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price 9999999以下で入力して下さい')
      end
      it 'priceが全角ではいけない' do
        @item.price = 'ああ'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price 300円以上で入力して下さい', 'Price 9999999以下で入力して下さい')
      end

      it 'priceが英数混合ではいけない' do
        @item.price = 'abc123'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price 300円以上で入力して下さい', 'Price 9999999以下で入力して下さい')
      end

      it 'priceが半角英数ではいけない' do
        @item.price = 'aaaaa'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price 300円以上で入力して下さい', 'Price 9999999以下で入力して下さい')
      end
    end
  end
end
