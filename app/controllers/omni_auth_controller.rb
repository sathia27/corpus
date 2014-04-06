class OmniAuthController < Devise::OmniauthCallbacksController

  def facebook
    puts request.env["omniauth.auth"]
    user = User.find_for_oauth(request.env["omniauth.auth"])
    if user.persisted?
      flash[:notice] = I18n.t "devise.omniauth_callbacks.success", :kind => "Facebook"
      sign_in_and_redirect user, :event => :authentication
    else
      redirect_to words_path 
    end
  end
end
