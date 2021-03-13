class TweetsController < ApplicationController
before_action :authenticate_user!
before_action :set_tweet, only: [:show, :edit, :update, :destroy]
before_action :user_judge, only: [:edit, :update, :destroy]

  def index
    @tweets = Tweet.order(created_at: :desc)
  end

  def new
    @tweets_tag = TweetsTag.new
  end

  def create
    @tweets_tag = TweetsTag.new(tweet_params)
    tag = params[:tweet][:tag_name].split(',')
    if @tweets_tag.valid?
      @tweets_tag.save(tag)
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  def edit
    @tweets_tag = TweetsTag.new(tweet: @tweet)
  end

  def update
    @tweets_tag = TweetsTag.new(tweet_params, tweet: @tweet)
    tag = params[:tweet][:tag_name].split(',')
    if @tweets_tag.valid?
      @tweets_tag.save(tag)
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

  def search
    return nil if params[:keyword] == ""
    tag = Tag.where(['tag_name LIKE ?', "%#{params[:keyword]}%"] )
    render json:{ keyword: tag }
  end

  private


  def tweet_params
    params.require(:tweet).permit(:text, :image, :tag_name).merge(user_id: current_user.id)
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
