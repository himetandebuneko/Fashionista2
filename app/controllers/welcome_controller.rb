class WelcomeController < ApplicationController
  def index
    guest_user
    redirect_to tweets_path if current_user
  end
end
