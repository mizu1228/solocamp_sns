class RelationshipsController < ApplicationController
  before_action :set_user

  def create
    following = current_user.follow(@user)
    if following.save
      flash[:success] = 'フォローしました'
    else
      flash.now[:alert] = 'フォローに失敗しました'
    end
  end

  def destroy
    following = current_user.unfollow(@user)
    if following.destroy
      flash[:success] = 'フォローを解除しました'
    else
      flash.now[:alert] = 'フォロー解除に失敗しました'
    end
  end

  private
  def set_user
    @user = User.find(params[:follow_id])
  end

end
