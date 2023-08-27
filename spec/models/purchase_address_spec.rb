require 'rails_helper'

RSpec.describe PurchaseAddress, type: :model do
  before do
    @order = FactoryBot.build(:purchase_address)
  end

  context '内容に問題ない場合' do
    it "tokenと住所と電話番号があれば保存ができること" do
      expect(@order).to be_valid
    end
  end

  context '内容に問題がある場合' do

    it "tokenが空では登録できないこと" do
      @order.token = nil
      @order.valid?
      expect(@order.errors.full_messages).to include("Token can't be blank")
    end

# 住所などに問題ある場合の記述を書く




  end
end
