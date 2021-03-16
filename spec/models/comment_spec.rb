require 'rails_helper'

RSpec.describe Comment, type: :model do
  before do
    @comment = FactoryBot.build(:comment)
  end

  describe 'コメント投稿' do
    context 'コメントできるとき' do
      it '本文があれば投稿できる' do
        expect(@comment).to be_valid
      end

      it '140文字いないなら投稿できる' do
        @comment.comment = "#{'a' * 140}"
        expect(@comment).to be_valid
      end
    end

    context 'コメントできないとき' do
      it '本文が空では投稿できないこと' do
        @comment.comment = ""
        @comment.valid?
        expect(@comment.errors.full_messages).to include('コメントを入力してください')
      end
      it '140字以上だと投稿できない' do
        @comment.comment = "#{'a' * 141}"
        @comment.valid?
        expect(@comment.errors.full_messages).to include('コメントは140文字以内で入力してください')
      end
      
    end
  end
end
