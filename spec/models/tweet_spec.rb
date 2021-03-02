require 'rails_helper'

RSpec.describe Tweet, type: :model do

  before do
    @tweet = FactoryBot.build(:tweet)
  end

  describe '新規投稿' do

    context '新規投稿ができる時' do
      it '紐づくユーザーがおり、画像とテキストがあれば投稿できる' do
        expect(@tweet).to be_valid
      end
    end

    context '新規投稿ができない時' do
      it '画像もテキストも無い場合投稿できなこと' do
        @tweet.text = ''
        @tweet.image = nil
        @tweet.valid?
        expect(@tweet.errors.full_messages).to include('本文を入力してください', '画像を入力してください')
      end
      it '画像がない場合は投稿できないこと' do
        @tweet.image = nil
        @tweet.valid?
        expect(@tweet.errors.full_messages).to include('画像を入力してください')
      end
      it 'テキストがない場合は投稿できないこと' do
        @tweet.text = ''
        @tweet.valid?
        expect(@tweet.errors.full_messages).to include('本文を入力してください')
      end
      it 'ユーザーが紐づいていない場合は投稿できないこと' do
        @tweet.user = nil
        @tweet.valid?
        expect(@tweet.errors.full_messages).to include('ユーザーを入力してください')
      end
    end

  end
end
