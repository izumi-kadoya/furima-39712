require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品機能' do
    context '商品が出品できる場合' do
      it '商品名、商品の説明、商品の詳細、配送について、販売価格の情報が揃っていれば出品できる' do
        expect(@item).to be_valid
      end
    end
    context '商品が出品できない場合' do
      it '商品画像が空では出品できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image must be attached.")
      end
      it '商品名が空では出品できない' do
        @item.title = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Title can't be blank")
      end
      it '商品名が４１文字以上では出品できない' do
        @item.title = "12345678901234567890123456789012345678901"
        @item.valid?
        expect(@item.errors.full_messages).to include("Title is too long (maximum is 40 characters)")
      end
      it '商品の説明が空では出品できない' do
        @item.detail = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Detail can't be blank")
      end
      it '商品の説明が１００１文字以上では出品できない' do
        @item.detail = Faker::Lorem.sentence(word_count: 2000)
        @item.valid?
        expect(@item.errors.full_messages).to include("Detail is too long (maximum is 1000 characters)")
      end
      it '商品の詳細「カテゴリー」が空では出品できない' do
        @item.category_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it '商品の詳細「カテゴリー」が「---」では出品できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it '商品の詳細「商品の状態」が空では出品できない' do
        @item.condition_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition can't be blank")
      end
      it '商品の詳細「商品の状態」が「---」では出品できない' do
        @item.condition_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition can't be blank")
      end
      it '配送について「配送料の負担」が空では出品できない' do
        @item.fee_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Fee can't be blank")
      end
      it '配送について「配送料の負担」が「---」では出品できない' do
        @item.fee_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Fee can't be blank")
      end
      it '配送について「発送元の地域」が空では出品できない' do
        @item.prefecture_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank")
      end
      it '配送について「発送元の地域」が「---」では出品できない' do
        @item.prefecture_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank")
      end
      it '配送について「発送までの日数」が空では出品できない' do
        @item.duration_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Duration can't be blank")
      end
      it '配送について「発送までの日数」が「---」では出品できない' do
        @item.duration_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Duration can't be blank")
      end
      it '販売価格が空では出品できない' do
        @item.price = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it '販売価格が文字を含むと出品できない' do
          @item.price = "300a"
          @item.valid?
          expect(@item.errors.full_messages).to include("Price is not a number")
      end
      it '販売価格が299円以下では出品できない' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
      end
      it '販売価格が10,000,000円以上では出品できない' do
        @item.price = 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999")
      end
      it '販売価格が全角英数では出品できない' do
        @item.price = "３００"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end
      it '販売価格が小数点をを持つ数値では出品できない' do
        @item.price = 300.55
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be an integer")
      end
      it 'ユーザーが紐付いていなければ投稿できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("User must exist")
      end
    end
  end
end
