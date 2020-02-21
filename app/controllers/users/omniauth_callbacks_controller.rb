class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController

  # callback for facebook
  # def facebook
  #   callback_for(:facebook)
  # end

  # # callback for twitter
  # def twitter
  #   callback_for(:twitter)
  # end

  # callback for google
  def google
    @user = User.from_omniauth(request.env['omniauth.auth'])

    if @user.persisted?
      flash[:notice] = I18n.t 'devise.omniauth_callbacks.success', kind: 'Google'
      sign_in_and_redirect @user, event: :authentication
    else
      session['devise.google_data'] = request.env['omniauth.auth']
      redirect_to new_user_registration_url
    end
  end
 

end