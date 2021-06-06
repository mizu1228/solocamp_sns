class CommentsController < ApplicationController
  def new
    @comments = Comment.all
    @comment = Comment.new
  end

  def create
    @tweet = Tweet.find(params[:tweet_id])
    @comment = Comment.new(comment_params)
    # binding.pry
    if @comment.save
      # binding.pry
      ActionCable.server.broadcast 'comment_channel', comment: @comment, user: @comment.user, image: url_for(@comment.user.image), tweet: @tweet
      # binding.pry
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    # @comments = Comment.all
    # @comment = Comment.find_by(id: params[:id], tweet_id: params[:tweet_id])
    # if @comment.destroy
    # redirect_to tweet_path(params[:tweet_id])
    # end
    Comment.find_by(id: params[:id], tweet_id: params[:tweet_id]).destroy
  end

private

def comment_params
  params.require(:comment).permit(:comment).merge(user_id: current_user.id, tweet_id: params[:tweet_id])
end
end
