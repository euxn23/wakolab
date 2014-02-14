class SessionsController < ApplicationController
  def create
    auth = request.env["omniauth.auth"]
    puts auth["provider"]
    user = User.find_by_provider_and_uid(auth["provider"], auth["uid"]) ||
      User.create_with_omniauth(auth)
    session[:user_uid] = user.uid
    session[:user_name] = user.name
    session[:user_sid] = user.sid
    session[:oauth_token] = auth.credentials.token

    Twitter::REST::Client.new do |config|
      config.oauth_token = auth['credentials']['token']
      config.oauth_token_secret = auth['credentials']['secret']
    end

    redirect_to session[:current_path], :notice => "Signed in."
  end

  def destroy
    session[:user_uid] = nil
    session[:oauth_token] = nil
    redirect_to session[:current_path], :notice => "Signed out."
  end
end
