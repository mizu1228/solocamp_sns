class TweetsController < ApplicationController
before_action :authenticate_user!
before_action :set_tweet, only: [:show, :edit, :update, :destroy]
before_action :user_judge, only: [:edit, :update, :destroy]

  def index
    @tweets = Tweet.order(created_at: :desc)
  end

  def new
    @tweet = TweetsTag.new
  end

  def create
    @tweet = TweetsTag.new(tweet_params)
    tag_list = params[:tweets_tag][:name].split(",")
    if @tweet.valid?
      @tweet.save(tag_list)
      return  redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @tweet.update(tweet_params)
      redirect_to tweet_path
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

  private

  def tweet_params
    params.require(:tweets_tag).permit(:text, :image, :name).merge(user_id: current_user.id)
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
