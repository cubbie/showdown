class SessionsController < ApplicationController


  def create # Allows the user to log in (create a session)
    user = User.find_by(email: allowed_session_params[:email])
    if user && user.authenticate(allowed_session_params[:password])
      session[:user_id] = user.id
      redirect_to root_url
    else
      redirect_to :back
    end
  end

  def destroy # allows the user to log out, (set the session to nil)
    session[:user_id] = nil
    redirect_to root_url
  end

  private
  def allowed_session_params
    params.permit(:email, :password)
  end
end
