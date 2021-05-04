class TweetsController < ApplicationController
before_action :set_tweet, only: [:show, :edit, :update, :destroy]
before_action :user_judge, only: [:edit, :update, :destroy]

  def index
    @tweets = Tweet.order(created_at: :desc).includes(:user)
    @tweets.each do |tweet|
      @tweet = tweet
      @comments = @tweet.comments.order(created_at: :desc).includes(:user)
    end
    def comment_create
      @comment = Comment.new
      if @comment.save
        redirect_to root_path
      else
        render :index
        return
      end
    end
  end

  def new
    @tweets_tag = TweetsTag.new
  end

  def create
    @tweets_tag = TweetsTag.new(tweet_params)
    if @tweets_tag.valid?
      @tweets_tag.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @comment = Comment.new
    @comments = @tweet.comments.order(created_at: :desc).includes(:user)
  end

  def edit
    @tweets_tag = TweetsTag.new(tweet: @tweet)
  end

  def update
    @tweets_tag = TweetsTag.new(tweet_params, tweet: @tweet)
    if @tweets_tag.image == nil
      @tweets_tag.image = @tweet.image.blob
    end
    if @tweets_tag.valid?
      @tweets_tag.save
      redirect_to tweet_path(@tweet)
    else
      render :edit
    end
  end

  def destroy
    if @tweet.destroy
      redirect_to root_path
    else
      render :edit
    end
  end

  # タグ逐次検索機能のサーチメソッド
  def search
    return nil if params[:keyword] == ""
    tag = Tag.where(['tag_name LIKE ?', "%#{params[:keyword]}%"] )
    render json:{ keyword: tag }
  end

  def tag
    @user = current_user
    @tag = Tag.find_by(tag_name: params[:name])
    @tweets = @tag.tweets
  end

  private


  def tweet_params
    params.require(:tweet).permit(:text, :image, :tag_name, :camp_site_id).merge(user_id: current_user.id)
  end


  def set_tweet
    @tweet = Tweet.find(params[:id])
  end

  def user_judge
    if current_user.id != @tweet.user_id
      redirect_to root_path
    end
  end

end
