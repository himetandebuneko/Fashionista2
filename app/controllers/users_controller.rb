class UsersController < ApplicationController
  def show
    user = User.find(params[:id])
    @nickname = user.nickname
    @tweets = user.tweets.page(params[:page]).per(5).order("created_at DESC")
  end
  # def index
  #   # @all_ranks = Tweet.find(Like.group(:tweet_id).order('count(tweet_id) desc').page(params[:page]).per(5).pluck(:tweet_id))
  # end

  def guest
    guest_user # guest_userを作成する
    redirect_to tweets_path
  end
  
end
