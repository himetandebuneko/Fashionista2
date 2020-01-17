class UsersController < ApplicationController
  def show
    user = User.find(params[:id])
    @nickname = user.nickname
    @tweets = user.tweets.page(params[:page]).per(5).order("created_at DESC")
  end

  def guest
    guest_user # guest_userを作成する
    redirect_to tweets_path
  end
  
end
