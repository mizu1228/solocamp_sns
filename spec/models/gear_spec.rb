require 'rails_helper'

RSpec.describe Gear, type: :model do
  before do
    @user = FactoryBot.build(:user)
    @tweet = FactoryBot.build(:tweet)
    @gear = FactoryBot.build(:gear)
  end

  describe 'ギア新規登録' do
    context '登録できる時' do
      it '正しい情報があれば登録できる' do
        expect(@gear).to be_valid
      end
      it '画像がなくても登録できる' do
        @gear.image = nil
        expect(@gear).to be_valid
      end
      it '説明がなくても登録できる' do
        @gear.explanation = ""
        expect(@gear).to be_valid
      end
      it 'tweetに紐づいていなくても登録できる' do
        @gear.tweet_id = nil
        expect(@gear).to be_valid
      end
    end

    context '登録できない時' do
      it 'ギア名が空では登録できないこと' do
        @gear.gear_name = ""
        @gear.valid?
        expect(@gear.errors.full_messages).to include('ギアの名前を入力してください')
      end
      it 'ジャンルが未選択だと登録できないこと' do
        @gear.gear_genre_id = 0
        @gear.valid?
        expect(@gear.errors.full_messages).to include('ジャンルを選択してください')
      end
      it 'ユーザー情報がないと登録できないこと' do
        @gear.user_id= nil
        @gear.valid?
        expect(@gear.errors.full_messages).to include("Userを入力してください", "Userを入力してください")

      end
    end

  end
end
