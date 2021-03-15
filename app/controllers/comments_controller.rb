class CommentsController < ApplicationController
  def new
    @comments = Comment.all
    @comment = Comment.new
  end

  def create
    # tweet = Tweet.find(params[:tweet_id])
    @comment = Comment.new(comment_params) #(comment: params[:comment][:comment])
    # binding.pry
    if @comment.save
      ActionCable.server.broadcast 'comment_channel', content: @comment
    end
  end

private

def comment_params
  params.require(:comment).permit(:comment).merge(user_id: current_user.id, tweet_id: params[:tweet_id])
end
end
