class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def facebook
  	@user = User.find_for_facebook_oauth request.env["omniauth.auth"]
  	if @user.persisted?
  		flash["notice"] = I18n.t "devise.omniauth_callbacks.sucsess", :kind => "Facebook"
  		sign_in_and_redirect @user, :event => :authentication
  	else
  		flash[:notice] = "Authentication error!"
  		redirect_to root_path
  	end
  end

  def vkontakte
  	@user = User.find_for_vkontakte_oauth request.env["omniauth.auth"]
  	if @user.persisted?
  		flash["notice"] = I18n.t "devise.omniauth_callbacks.sucsess", :kind => "Vkontakte"
  		sign_in_and_redirect @user, :event => :authentication
  	else
  		flash[:notice] = "Authentication error!"
  		redirect_to root_path
  	end
  end
end
