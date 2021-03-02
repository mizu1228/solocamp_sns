class TweetsController < ApplicationController
before_action :authenticate_user!

  def index
  end

  def new
    @tweet = Tweet.new
  end

end
