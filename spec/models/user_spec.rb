require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do

    context '新規登録できる時' do
      it '正しい情報を入力すれば登録できる' do
        expect(@user).to be_valid
      end
      it 'passwordが半角英数8字以上なら登録できる' do
        @user.password = '123abcde'
        @user.password_confirmation = '123abcde'
        expect(@user).to be_valid
      end
    end

    context '新規登録できない時' do
      it 'ユーザー名が空だと登録できないこと' do
        @user.name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('ニックネームを入力してください')
      end
      it 'emailが空だと登録できないこと' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('メールアドレスを入力してください')
      end
      it 'passwordが空だと登録できないこと' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードを入力してください', 'パスワードは半角英数混在で入力してください')
      end
      it 'password_confirmationが空だと登録できないこと' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワード（確認用）とパスワードの入力が一致しません', 'パスワード（確認用）を入力してください')
      end
      it 'passwordとpassword_confirmationが不一致だと登録できないこと' do
        @user.password_confirmation = '1111aaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワード（確認用）とパスワードの入力が一致しません')
      end
      it 'passwordが数字のみだと登録できない' do
        @user.password = '12345678'
        @user.password_confirmation = '12345678'
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードは半角英数混在で入力してください')
      end
      it 'passwordが英字のみだと登録できない' do
        @user.password = 'abcdefgh'
        @user.password_confirmation = "abcdefgh"
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードは半角英数混在で入力してください')
      end
      it 'passwordが半角英数以外だと登録できない' do
        @user.password = 'あいうエ尾１1a'
        @user.password_confirmation = 'あいうエ尾１1a'
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードは半角英数混在で入力してください')
      end
      it 'passwordが8字以下だと登録できない' do
        @user.password = '123abcd'
        @user.password_confirmation = '123abcd'
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードは8文字以上で入力してください')
      end
      it 'phone_numが空だと登録できないこと' do
        @user.phone_num = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('電話番号を入力してください', '電話番号は半角数字10~11桁、ハイフンなしで入力してください')
      end
      it 'phone_numが10桁以下だと登録できないこと' do
        @user.phone_num = '123456789'
        @user.valid?
        expect(@user.errors.full_messages).to include('電話番号は半角数字10~11桁、ハイフンなしで入力してください')
      end
      it 'phone_numが半角数字以外だと登録できないこと' do
        @user.phone_num = '１２３４５６７８９０'
        @user.valid?
        expect(@user.errors.full_messages).to include('電話番号は半角数字10~11桁、ハイフンなしで入力してください')
      end
    end

  end
end
