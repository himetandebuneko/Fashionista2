class WelcomeController < ApplicationController
  layout "second_layout"
  def index
    guest_user
    redirect_to tweets_path if current_user 
  end
end
