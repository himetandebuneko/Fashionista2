class FavoriteController < ApplicationController

  def index
    @all_ranks = Tweet.find(Like.group(:tweet_id).order('count(tweet_id) desc').page(params[:page]).per(10).pluck(:tweet_id))
  end
end
