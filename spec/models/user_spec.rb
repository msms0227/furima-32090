require 'rails_helper'
RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end
  describe '新規登録' do
    context '新規登録がうまくいくとき' do
      it '入力項目を全て記入すれば登録できる' do
        expect(@user).to be_valid
      end
    end

    context '新規登録がうまくいかないとき' do
      it 'nicknameが空ではいけない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end

      it 'passwordが空ではいけない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end

      it 'passwordは6文字以下だと登録できない' do
        @user.password = '11'
        @user.password_confirmation = '11'
        @user.valid?
        # binding.pry
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end

      it 'passwordは半角英数字混合だと登録できない' do
        @user.password = 'あいうえおかき'
        @user.password_confirmation = 'あいうえおかき'
        @user.valid?
        # binding.pry
        expect(@user.errors.full_messages).to include('Password 半角英数字混合で入力してください')
      end

      it 'passwordは確認用と一致しなければならない' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
        # binding.pry
      end

      it 'emailが空ではいけない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end

      it '登録済みのemailは保存できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end

      it '@なしではemailは保存できない' do
        @user.email = 'abcdfer'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end

      it 'last_nameが空ではいけない' do
        @user.last_name = ''
        @user.valid?
        # binding.pry
        expect(@user.errors.full_messages).to include("Last name can't be blank")
      end

      it 'last_nameは全角（漢字・ひらがな・カタカナ）でなければならない' do
        @user.last_name = 'abc'
        @user.valid?
        # binding.pry
        expect(@user.errors.full_messages).to include('Last name 全角文字を使用してください')
      end

      it 'first_nameが空ではいけない' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end

      it 'first_nameは全角（漢字・ひらがな・カタカナ）でなければならない' do
        @user.first_name = 'abc'
        @user.valid?
        # binding.pry
        expect(@user.errors.full_messages).to include('First name 全角文字を使用してください')
      end

      it 'last_name_kanaが空ではいけない' do
        @user.last_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana can't be blank")
      end

      it 'last_name_kanaカタカナでないといけない' do
        @user.last_name_kana = '山田'
        @user.valid?
        # binding.pry
        expect(@user.errors.full_messages).to include('Last name kana 全角カタカナのみで入力して下さい')
      end

      it 'first_name_kanaが空ではいけない' do
        @user.first_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana can't be blank")
      end

      it 'first_name_kanaがカタカナでないといけない' do
        @user.first_name_kana = 'tarou'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name kana 全角カタカナのみで入力して下さい')
      end

      it 'birthdayが空ではいけない' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
    end
  end
end
