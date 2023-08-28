require 'rails_helper'

RSpec.describe PurchaseAddress, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @order = FactoryBot.build(:purchase_address, user_id: user.id, item_id: item.id)
  end

  context '内容に問題ない場合' do
    it 'tokenと住所と電話番号があれば保存ができること' do
      expect(@order).to be_valid
    end
    it '建物名が空でも保存ができること' do
      @order.building = ''
      expect(@order).to be_valid
    end
  end

  context '内容に問題がある場合' do
    it 'tokenが空では登録できないこと' do
      @order.token = nil
      @order.valid?
      expect(@order.errors.full_messages).to include("Token can't be blank")
    end
    it '郵便番号が空では登録できないこと' do
      @order.postcode = ''
      @order.valid?
      expect(@order.errors.full_messages).to include("Postcode can't be blank",
                                                     'Postcode is invalid. Enter it as follows (e.g. 123-4567)')
    end

    it '郵便番号にハイフンがない状態では登録できないこと' do
      @order.postcode = '1234567'
      @order.valid?
      expect(@order.errors.full_messages).to include('Postcode is invalid. Enter it as follows (e.g. 123-4567)')
    end
    it '郵便番号が全角入力の状態では登録できないこと' do
      @order.postcode = '１２３ー４５６７'
      @order.valid?
      expect(@order.errors.full_messages).to include('Postcode is invalid. Enter it as follows (e.g. 123-4567)')
    end
    it '都道府県が空では登録できないこと' do
      @order.prefecture_id = ''
      @order.valid?
      expect(@order.errors.full_messages).to include("Prefecture can't be blank")
    end
    it '都道府県の「カテゴリー」が「---」では登録できないこと' do
      @order.prefecture_id = 1
      @order.valid?
      expect(@order.errors.full_messages).to include("Prefecture can't be blank")
    end
    it '市区町村が空では登録できないこと' do
      @order.city = ''
      @order.valid?
      expect(@order.errors.full_messages).to include("City can't be blank")
    end
    it '番地が空では登録できないこと' do
      @order.street = ''
      @order.valid?
      expect(@order.errors.full_messages).to include("Street can't be blank")
    end
    it '電話番号が空では登録できないこと' do
      @order.tel = ''
      @order.valid?
      expect(@order.errors.full_messages).to include("Tel can't be blank")
    end
    it '電話番号が全角では登録できないこと' do
      @order.tel = '０９０１２３４５６７８'
      @order.valid?
      expect(@order.errors.full_messages).to include('Tel is invalid')
    end
    it '電話番号が９桁以下では登録できないこと' do
      @order.tel = '12345678'
      @order.valid?
      expect(@order.errors.full_messages).to include('Tel is invalid')
    end
    it '電話番号が１２桁以上では登録できないこと' do
      @order.tel = '123456789012'
      @order.valid?
      expect(@order.errors.full_messages).to include('Tel is invalid')
    end
    it 'ユーザーが紐付いていなければ投稿できない' do
      @order.user_id = nil
      @order.valid?
      expect(@order.errors.full_messages).to include("User can't be blank")
    end
    it 'アイテムが紐付いていなければ投稿できない' do
      @order.item_id = nil
      @order.valid?
      expect(@order.errors.full_messages).to include("Item can't be blank")
    end
  end
end
