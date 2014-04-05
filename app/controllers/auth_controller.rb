class AuthController < ActionController::Base

  # Checks if the user has succesfully authed
  def auth

    session[:authed] = true
    

    redirect_to '/'
   
  end
end
