require 'rails_helper'
require 'pry'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できるとき' do
      it 'nicknameとemail、passwordとpassword_confirmation、lastnameとfirstnameと各kana、birthdayが存在すれば登録できる' do
        expect(@user).to be_valid
      end
    end
    context '新規登録できないとき' do
      it 'nicknameが空では登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it 'emailが一意性を持っていないと登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end
      it 'emailに@が含まれないと登録できない' do
        @user.email = 'testmail'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end
      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank", "Password confirmation doesn't match Password")
      end
      it 'passwordが5文字以下では登録できない' do
        @user.password = '1234a'
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
      it 'passwordが英語のみでは登録できない' do
        @user.password = 'aaaaaa'
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid')
      end
      it 'passwordが数字のみでは登録できない' do
        @user.password = '111111'
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid')
      end
      it 'passwordが全角文字を含むと登録できない' do
        @user.password = '１ａａａ1a'
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid')
      end
      it 'passwordとpassword_confirmationが異なると登録できない' do
        @user.password = '12345a'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'お名前(全角)の姓がないと登録できない' do
        @user.lastname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Lastname can't be blank", 'Lastname is invalid')
      end
      it 'お名前(全角)の姓に半角文字が含まれると登録できない' do
        @user.lastname = 'ｲｼｶﾜ'
        @user.valid?
        expect(@user.errors.full_messages).to include('Lastname is invalid')
      end
      it 'お名前(全角)の名がないと登録できない' do
        @user.firstname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Firstname can't be blank", 'Firstname is invalid')
      end
      it 'お名前(全角)の名に半角文字が含まれると登録できない' do
        @user.firstname = 'ﾊﾅｺ'
        @user.valid?
        expect(@user.errors.full_messages).to include('Firstname is invalid')
      end
      it 'お名前カナ(全角)の姓がないと登録できない' do
        @user.lastname_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Lastname kana can't be blank", 'Lastname kana is invalid')
      end
      it 'お名前カナ(全角)の姓にカナ以外の文字が含まれると登録できない' do
        @user.lastname_kana = '石川'
        @user.valid?
        expect(@user.errors.full_messages).to include('Lastname kana is invalid')
      end
      it 'お名前カナ(全角)の名がないと登録できない' do
        @user.firstname_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Firstname kana can't be blank", 'Firstname kana is invalid')
      end
      it 'お名前カナ(全角)の名にカナ以外の文字が含まれると登録できない' do
        @user.firstname_kana = 'はなこ'
        @user.valid?
        expect(@user.errors.full_messages).to include('Firstname kana is invalid')
      end
      it '生年月日が空では登録できない' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
    end
  end
end
