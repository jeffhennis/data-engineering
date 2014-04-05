class ApplicationController < ActionController::Base
  
  # Makes request to Google to auth a user
  def require_authentication
    if session[:authed].nil?
      redirect_to '/auth/google'
     end
  end

end
