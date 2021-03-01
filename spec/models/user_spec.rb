require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do

    context '新規登録できる時' do
      it '正しい情報を入力すれば登録できる' do
      end
      it 'passwordが半角英数6字以上なら登録できる' do
      end
    end

    context '新規登録できない時' do
      it 'ユーザー名が空だと登録できないこと' do
      end
      it 'emailが空だと登録できないこと' do
      end
      it 'passwordが空だと登録できないこと' do
      end
      it 'password_confirmationが空だと登録できないこと' do
      end
      it 'passwordとpassword_confirmationが不一致だと登録できないこと' do
      end
      it 'phone_numが空だと登録できないこと' do
      end
      it 'phone_numが10桁以下だと登録できないこと' do
      end

    end
  end
end
