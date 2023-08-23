require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品機能' do
    context '商品が出品できる場合' do
      it '商品名、商品の説明、商品の詳細、配送について、販売価格の情報が揃っていれば出品できる' do
      end
    end
    context '商品が出品できない場合' do
      it '商品画像が空では出品できない' do
      end
      it '商品名が空では出品できない' do
      end
      it '商品名が４１文字以上では出品できない' do
      end
      it '商品の説明が空では出品できない' do
      end
      it '商品の説明が１００１文字以上では出品できない' do
      end
      it '商品の詳細「カテゴリー」が空では出品できない' do
      end
      it '商品の詳細「カテゴリー」が「---」では出品できない' do
      end
      it '商品の詳細「商品の状態」が空では出品できない' do
      end
      it '商品の詳細「商品の状態」が「---」では出品できない' do
      end
      it '配送について「配送料の負担」が空では出品できない' do
      end
      it '配送について「配送料の負担」が「---」では出品できない' do
      end
      it '配送について「発送元の地域」が空では出品できない' do
      end
      it '配送について「発送元の地域」が「---」では出品できない' do
      end
      it '配送について「発送までの日数」が空では出品できない' do
      end
      it '配送について「発送までの日数」が「---」では出品できない' do
      end
      it '販売価格が空では出品できない' do
      end
      it '販売価格が299円以下では出品できない' do
      end
      it '販売価格が10,000,000円以上では出品できない' do
      end
      it '販売価格が全角英数では出品できない' do
      end
      it '販売価格が小数点をを持つ数値では出品できない' do
      end
  
      it 'ユーザーが紐付いていなければ投稿できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("User must exist")
      end
    end
  end
end
